clear all;
for i=0:3399
    filename = sprintf(‘Displacement.%g',i);
    data = dlmread(filename,' ',9,0);%Skipping the inital 9 lines
    dis1 = data((data(:,1)==1),2);%Displacement of First atom ('1' representing atom type)
    dis2 = data((data(:,1)==2),2);%Displacement of Second atom ('2' representing atom type)
    dis3 = data((data(:,1)==3),2);%Displacement of Third atom ('3' representing atom type)
    msd1(i+1) = sum(disp1.^2)/length(disp1);
    msd2(i+1) = sum(disp2.^2)/length(disp2);
    msd3(i+1) = sum(disp3.^2)/length(disp2);
end

x = (0:1.5e-3*10:3399*10*1.5e-3); %starting at time t=0, with a time step of 1.5 fs upto 
                                  %required number of time steps to reach 50 ps trajectory

plot(x,msd1,'b-','linewidth',3); hold on;
plot(x,msd3,'g-','linewidth',3); hold on;
plot(x,msd2,'r-','linewidth',3);

 
