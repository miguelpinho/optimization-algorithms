function [ distance_to_section ] = task5( point, center, radius )
%TASK5 - Calculates distance form given point to edge of circle
    distance_to_section =  ;

    if norm(point - center ) > radius
        distance_to_section =  norm(point - center ) - radius;
    else
        distance_to_section = 0;
    end

end

