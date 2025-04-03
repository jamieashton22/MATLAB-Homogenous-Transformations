
%% Computing Homogenous Transformations 

%% 1) DH Parameters 

% take user input for l1, l2 and l3 from student id

l1 = input("Enter last digit of student id: ");
l2 = input("Enter second-to-last digit of student id: ");
l3 = input("Enter third-to-last digit of student id: ");


th1_t1 = 3*pi/16;
th1_t2 = pi/4;          %values of theta 1 at each time (t1,t2,t3)
th1_t3 = pi/4;

a1 = 0;
d1 = l1 + 2;                 % rest of DH parameters
alph1 = -pi/2;

th2_t1 = 0;
th2_t2 = 3*pi/8;        %values of theta 2 at each time (t1,t2,t3)
th2_t3 = pi/2;

d2 = 0;
a2 = 3 + l2/3;              % rest of DH parameters
alph2 = 0;

th3_t1 = -pi/4;
th3_t2 = -pi/4;         %values of theta 3 at each time (t1,t2,t3)
th3_t3 = pi/8;

d3 = 0;
a3 = 2 + l3/4;             % rest of DH parameters
alph3 = 0;


%% 2) Function to calculate homogenous transformations

function H = homogenous_transform(d,theta, a, alpha)
        
        H = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
            sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta)
            0, sin(alpha), cos(alpha), d
            0, 0, 0, 1];

end

%% 3) Compute each homogenous transformation

% for t = 1.75s

 H1t1 = homogenous_transform(d1,th1_t1, a1, alph1);
 disp('H0-1 at t1: '); disp(H1t1);

 H2t1 = homogenous_transform(d2,th2_t1, a2, alph2);
 disp('H1-2 at t1: '); disp(H2t1);

 H3t1 = homogenous_transform(d3,th3_t1, a3, alph3);
 disp('H2-3 at t1: '); disp(H3t1);
 
 % for t = 2.75s

 H1t2 = homogenous_transform(d1,th1_t2, a1, alph1);
 disp('H0-1 at t2: '); disp(H1t2);

 H2t2 = homogenous_transform(d2, th2_t2, a2, alph2);
 disp('H1-2 at t2: '); disp(H2t2);

 H3t2 = homogenous_transform(d3,th3_t2, a3, alph3);
 disp('H2-3 at t2: '); disp(H3t2);

 % for t = 3.75s
 
 H1t3 = homogenous_transform(d1,th1_t3, a1, alph1);
 disp('H0-1 at t3: '); disp(H1t3);

 H2t3 = homogenous_transform(d2,th2_t3, a2, alph2);
 disp('H1-2 at t3: '); disp(H2t3);

 H3t3 = homogenous_transform(d3,th3_t3, a3, alph3);
 disp('H2-3 at t3: '); disp(H3t3);


%% 3) End-Effector Positions

Et1 = H1t1 * H2t1 * H3t1;
Et2 = H1t2 * H2t2 * H3t2;
Et3 = H1t3 * H2t3 * H3t3;


disp('Final transformation at t = 1.75s: ');  disp(Et1);
disp('Final transformation at t = 2.75s: ');  disp(Et2);
disp('Final transformation at t = 3.75s: ');  disp(Et3);

disp('End effector position at t = 1.75s: ');  disp(Et1(1:3, 4));
disp('End effector position at t = 2.75s: ');  disp(Et2(1:3, 4));
disp('End effector position at t = 3.75s: ');  disp(Et3(1:3, 4));