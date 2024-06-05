msd = zeros(3400,1);
for i=0:3399
    filename = sprintf(‘Displacement.%g',i);
    data = dlmread(filename,' ',9,0);%Skipping the inital 9 lines
    disp1 = data((data(:,1)==1),2);%Displacement of Na-atom ('1' representing atom type)
    disp2 = data((data(:,1)==2),2);%Displacement of N-atom ('2' representing atom type)
    disp3 = data((data(:,1)==3),2);%Displacement of B-atom ('3' representing atom type)
    msd1(i+1) = sum(disp1.^2)/length(disp1);
    msd2(i+1) = sum(disp2.^2)/length(disp2);
    msd3(i+1) = sum(disp3.^2)/length(disp2);
end

x = (0:1.5e-3*10:3399*10*1.5e-3); %starting at time t=0, with a time step of 1.5 fs upto 
                                  %required number of time steps to reach 50 ps trajectory

plot(x,msd1,'b-','linewidth',3); hold on;
plot(x,msd3,'g-','linewidth',3); hold on;
plot(x,msd2,'r-','linewidth',3);
 
p = polyfit(x, msd1,1); %Linear fit for the MSD curve of Na-atom
 
D = p(1)/6; %Overall diffusion coefficient in 3-D space
xlabel('Time(ps)');
ylabel('MSD (^2)');
![image](https://github.com/kshitij1002/kshitij1011/assets/74930554/c9172868-577b-4cc6-b17f-128a231e1d27)
