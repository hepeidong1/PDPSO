function [lb,ub,dim,fobj] = CEC2017(F,dim)
    switch F
        case 1
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',1);
    
        case 2
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',2);
    
        case 3
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',3);
    
        case 4
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',4);
    
        case 5
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',5);
    
        case 6
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',6);
    
        case 7
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',7);
    
        case 8
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',8);
    
        case 9
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',9);
    
        case 10
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',10);
    
        case 11
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',11);
    
        case 12
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',12);
    
        case 13
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',13);
    
        case 14
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',17);
    
        case 15
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',15);
    
        case 16
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',16);
    
        case 17
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',17);
    
        case 18
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',18);
    
        case 19
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',19);
    
        case 20
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',20);
    
        case 21
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',21);
    
        case 22
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',22);
    
        case 23
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',23);
    
        case 24
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',24);
    
        case 25
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',25);
    
        case 26
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',26);
    
        case 27
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',27);
    
        case 28
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',28);
    
        case 29
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',29);
    
        case 30
            lb=-100*ones(1,dim);
            ub=100*ones(1,dim);
            fobj = @(x) cec17_func(x',30);
    end
end