function [x, converged, info] = JR_L_BFGS_B(x_0, fun, l, u, options)
% JR_L_BFGS_B
%   [x, converged] = JR_L_BFGS_B(x_0, fun, l, u, options) is a wrapper for the
% large scale BFGS algorithm with box constraints. Please download 
% lbfgsb.m [1] and the fortran code [2] from their authors' web pages. 
%
% Input:    
%   x_0 [vector]              
%       the initial vector to start the iteration
%
%   fun [function_handle]       
%       function to be minimized. It takes a vector as an input and 
%       provides the function value and the gradient at this position.
%
%   l [vector; optional]              
%       vector of lower bounds; leave empty or set to -inf to disable lower
%       bounds
%
%   u [vector; optional]              
%       vector of upper bounds; leave empty or set to +inf to disable upper
%       bounds
%
%   options [struct; optional]            
%       there are many options of the algorithm which can be changed
%
%       options.factr [DEFAULT = 1e+6]
%           tolerance for convergence         
%       options.pgtol [DEFAULT = 1e-6]
%           tolerance for convergence  
%       options.maxIts [DEFAULT = 3000]
%           maximum number of iterations
%       options.maxTotalIts [DEFAULT = 6000]
%           maximum number of total iterations (includes backtracking)
%       options.printEvery [DEFAULT = 0]
%           output printed every "options.printEvery" iterations
%       options.m [DEFAULT = 5]
%           number of previous gradients to estimate the Hessian. 
%   
% Output:
%   x [vector]
%       final iterate
%
%   converged [int]
%       number of iterations until convergence; -1 if not converged
%
%   [1] Becker, S. (2014). L-BFGS-B: Mex wrapper [online]. 
%       http://www.mathworks.co.uk/matlabcentral/fileexchange/35104-lbfgsb--l-bfgs-b--mex-wrapper
%
%   [2] Byrd, R. H., Lu, P., Nocedal, J., & Zhu, C. (1995). 
%       A limited memory algorithm for bound constrained optimization. 
%       SIAM Journal of Scientific Computing, 16(5), 1190–1208.
%
% 2014-08-06 --------------------------------------------------------------
% Matthias J. Ehrhardt
% CMIC, University College London, UK 
% matthias.ehrhardt.11@ucl.ac.uk
% http://www.cs.ucl.ac.uk/staff/ehrhardt/software.html
%
% -------------------------------------------------------------------------
% Copyright 2014 University College London
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%   http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
% -------------------------------------------------------------------------

    if nargin < 3 || numel(l) == 0; l = -inf * ones(size(x_0)); end;
    if nargin < 4 || numel(u) == 0; u =  inf * ones(size(x_0)); end;
    if nargin < 5 || numel(options) == 0; options = struct;     end;    
    if ~isfield(options, 'factr'),      options.factr      = 1e6;  end;
    if ~isfield(options, 'pgtol'),      options.pgtol      = 1e-6; end;
    if ~isfield(options, 'maxIts'),     options.maxIts     = 3000; end;
    if ~isfield(options, 'maxTotalIts'),options.maxTotalIts= 6000; end;
    if ~isfield(options, 'printEvery'), options.printEvery = 0;    end;
    if ~isfield(options, 'm'),          options.m          = 5;    end;
    
    options.x0 = x_0;    
    [x, ~, info] = lbfgsb(fun, l, u, options);
           
    if info.iterations == options.maxIts || info.totalIterations == options.maxTotalIts;
        converged = -1;
    else
        converged = info.iterations;
    end
    
end 