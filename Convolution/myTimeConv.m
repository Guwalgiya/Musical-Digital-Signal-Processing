% A discrete convolution function
function y = myTimeConv(x,h)
    

    
    a = length(x);
    b = length(h);
        
    
    len = a + b - 1;
    
    
    x = [x; zeros(b, 1)]; 
    h = [h; zeros(a, 1)];
    
    
    y = zeros(len, 1);
    
    
    
    for i = 1 : len
        temp = 0;
        for j = 1 : i
                temp = x(j) * h(i + 1 - j) + temp;   
        end
        y(i) = temp;
    end
end     