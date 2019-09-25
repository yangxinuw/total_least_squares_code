methods=["count_sketch","leverage_score","gaussian"];
for i=1:3
    for j=1:3
        s=sprintf('%s+%s.txt',methods(i),methods(j));
        disp(s);
    end
end