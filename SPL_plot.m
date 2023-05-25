% function SPL_plot(results,fn_main)


% figure()
% hold on
% 
% blunt_index = (2:2:numel(fn_main))
% 
% % for  i = 1:numel(fn_main)
% for i = blunt_index
% 
% 
%         plot(results.(fn_main{blunt_index(i)}).SPL,'x',MarkerSize=30) 
% end
% 

figure()
hold on
i=3;
plot(results.(fn_main{i}).SPL,'xk',MarkerSize=30)

i=4;
plot(results.(fn_main{i}).SPL,'xb',MarkerSize=30)

% legend(fn_main(1),fn_main(2))


% legend(fn_main)

% tl_spl = tiledlayout('flow');
% title(tl_spl,'Sound level pressure')
% 
% for i = 1:numel(fn_main)    
%     % nexttile    
%     is4 = rem(i, 4) == 0;
%     if is4 == 1
%         plot(results.(fn_main{i-1}).SPL,'x',MarkerSize=30)
%         plot(results.(fn_main{i}).SPL,'x',MarkerSize=30) 
%     end
% end
% % legend(fn_main)
% grid
% ylim([110 115])


% figure()
% a0 = 0;
% hold on
% for i = 1:numel(fn_main)
% 
%     iseven = rem(i, 2) == 0;
% 
%     if iseven == 0   % Odd --> A=0
%         if a0 == 0            
%             plot(i,results.(fn_main{i}).SPL,'xk',MarkerSize=10,LineWidth=1.5)
%             a0 = 1;
%         else
%             plot(i-2,results.(fn_main{i}).SPL,'.k',MarkerSize=20)
%             a0 = 0;
%         end
%     end
% end
% legend('Blunt','Standard','interpreter','latex',Location='northwest')
% xlim([0 16])
% grid
% xticks([1 5 9 13]);
% xticklabels({'0012','5512','63-418','64-421'})
% ylabel('Lift [N]')
% hold off


