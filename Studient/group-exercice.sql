SELECT sum(obtainedGrade)/sum(credit)*4.5, ID  
FROM (SELECT t.ID t.grade, c.credit, 
    CASE /* Creat a new temporaire categorie call obtainedGrade */
        WHEN t.grade = 'A+' THEN 4.5 * c.credit
        WHEN t.grade = 'A' THEN 4 * c.credit
        WHEN t.grade = 'B+' THEN 3.5 * c.credit
        WHEN t.grade = 'B' THEN 3 * c.credit
        WHEN t.grade = 'C+' THEN 2.5 * c.credit
        WHEN t.grade = 'C' THEN 2 * c.credit
        WHEN t.grade = 'D+' THEN 1.5 * c.credit
        WHEN t.grade = 'D' THEN 1 * c.credit
        ELSE 0
    END AS obtainedGrade 
    FROM takes t LEFT JOIN course c WHERE t.course_id = c.course_id 
        WHERE t.year = 2008 and t.semester = Spring) 
    /* Give nickname t and c to takes and course
    */
group by ID