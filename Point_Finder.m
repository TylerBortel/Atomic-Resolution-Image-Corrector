function point_finder = Point_Finder(data,minimumpeak)
close
p = FastPeakFind(data, minimumpeak);

imagesc(data); hold on

plot(p(1:2:end),p(2:2:end),'r+')
end