function config = tisisoReport(config)
% tisisoReport REPORTING of the expLanes experiment timbralSimilaritySol
%    config = tisisoInitReport(config)
%       config : expLanes configuration state

% Copyright: Mathieu Lagrange
% Date: 09-Jan-2017

if nargin==0, timbralSimilaritySol('report', 'rcv', 'reportName', 'karcherSlides'); return; end

switch config.reportName
    case 'karcherSlides'
        mask = {2:4, 1, 2, 1, 0, 5, 1, 1, 2, 2, 2, 2, 1, 1};
     config = expExpose(config, 't', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 3, 'shortFactors', 1, 'uncertainty', -1);
   case 'completeSlides'
        
      mask = {[3 4], [0], [1 2], 1, 0, 5, 1, 0, 0, 2, 2, 2, 1};
      config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'expand', 'sct', 'uncertainty', -1);
     mask = {[2 3 4], [0], [0], 1, 0, 5, 1, 1, 2, 2, 2, 2, 1};
     config = expExpose(config, 't', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 3, 'expand', 'sct', 'shortFactors', 1, 'uncertainty', -1);
     
    case 'splitSlides'
  
        %none
            mask = {[2  3  4], 1, 1, [2  3  4], 0, 5, 1, 1, 2, 2, 2, 2, 1, 1, 1};
     % config = expExpose(config, 't', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 3, 'uncertainty', -1, 'expand', 'test');

        % lmnn
      mask = {2:4, 1, 1:2, 2:4, 0, 5, 1, 1, 2, 2, 2, 2, 1, 1, 1};
      config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'expand', 'split', 'uncertainty', -1);
  %   config = expExpose(config, 'l', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'expand', 'split', 'shortFactors', -1, 'uncertainty', -1);

     mask = {2:4, 1, 1:2, 1:2, 2, 5, 1, 1, 2, 2, 2, 2, 1, 1, 1};
      config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'expand', 'split', 'uncertainty', -1);
 
  
    case 'perceptualProjectionSlides'
        
%         mask = {[2  3], 0, 0, 1, 2, 6, 1, 1, 2, 2, 2, 2, 1, 2};
%         config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'expand', 'sct', 'percent', 0, 'obs', 1, 'highlight', 0, 'uncertainty', -1);
% 

        mask = {[2 3], 1, 0, 1, 2, 5, 1, 1, 2, 2, 2, 2, 1};
      mask = {[3 4], 1, 0, 1, 2, 5, 1, 1, 2, 0, 0, 0, 1};
      
      mask = {[3], 1, 1, 1, 2, 5, 1, 1, 2, 0, 0, 0, 1};
      config = expExpose(config, 'l', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'visible', 0);
      mask{1} = 4;
      config = expExpose(config, 'l', 'step', 3, 'mergeDisplay', 'h', 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'noFactor', 1);
  
      mask = {[3], 1, 0, 1, 2, 5, 1, 1, 2, 2, 2, 2, 1};
      config = expExpose(config, 'l', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'visible', 0, 'shortFactors', 1);
      mask{1} = 4;
      config = expExpose(config, 'l', 'step', 3, 'mergeDisplay', 'h', 'mask', mask, 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'noFactor', 1);
  
        
        mask = {[2 3 4], 0, 0, 1, 2, 5, 1, 1, 2, 2, 2, 2, 1};
    %    config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'expand', 'sct', 'percent', 0, 'obs', 1, 'highlight', 0, 'precision', 4, 'uncertainty', -1);
        
    case 'scatteringTechniqueSlides'
        
        % database description
                config = expExpose(config, 't', 'obs', [6 5 7 8 9], 'step', 1, 'mask', {4, 1}, 'orientation', 'vi', 'caption', 'Sol db', 'precision', 0, 'highlight', -1);
                config = expExpose(config, 't', 'obs', [1:4], 'step', 1, 'mask', {4, 1}, 'orientation', 'vi', 'caption', 'Sol db', 'precision', 0, 'highlight', -1);
        
        
        gt = [1 4];
        %% mfcc parametrization
                for k=1:length(gt)
                    config = expExpose(config, 't', 'obs', 1, 'step', 3, 'mask', {[1 2] 1 1 1 0 gt(k) 1 1 0 1 1 0}, 'percent', 0, 'caption', 'Mel / mfcc: +');
                end
        
        %% scattering parametrization
                for k=1:length(gt)
                    config = expExpose(config, 't', 'obs', 1, 'step', 3, 'mask', {3 1 1 1 0 gt(k) 1 1 1 0 0 0}, 'percent', 0, 'caption', 'Scattering: +');
                end
        
        %% projection comparison (lmnn / lda)
        for k=1:length(gt)
            mask = {[2 3] 1 0 1 0 gt(k) 1 1 2 2 2 2};
            config = expExpose(config, 't', 'step', 3, 'mask', mask, 'percent', 0, 'obs', 1, 'expand', 'projection', 'highlight', -1, 'caption', 'Projection: +', 'orientation', 'vi');
        end
        
        %% projection control
         for k=1:length(gt)
            mask = {[2 3] 1 0 1 0 gt(k) 0 [1 2] 2 2 2 2};
            config = expExpose(config, 't', 'step', 3, 'mask', mask, 'expand', 'projection', 'percent', 0, 'obs', 1, 'highlight', -1, 'caption', 'Control learning: +');
        end
        
        %% split
         gt = [1 4];
         for k=1:length(gt)
            mask = {[2 3] 1 0 [1 2 3 5] 2 gt(k) 1 1 2 2 2 2};
            config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'expand', 'projection', 'percent', 0, 'obs', 1, 'highlight', -1, 'caption', 'db splitting: +');
         end
        %% frame size
        
        
        methods = {{2 0 0}, {3 0 0}, {[2 3] 0 0}};
        for k=1:length(gt)
            for m=1:size(methods, 2)
                mask = {methods{m}{:}, [1], 0, gt(k), 1, 1, 2, 2, 2, 2};
                config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'expand', 'sct', 'percent', 0, 'obs', 1, 'orderFactor', [1 6 3 2], 'tight', 0, 'caption', 'T: +');
            end
        end
        
        %% final
        
        mask = {[2  3], 0, 0, 1, 0, [1  4], 1, 1, 2, 2, 2, 2};
        config = expExpose(config, 'p', 'step', 3, 'mask', mask, 'expand', 'sct', 'percent', 0, 'obs', 1, 'tight', 0, 'caption', 'conclusion: +', 'shortFactors', 0);
      
    otherwise
end