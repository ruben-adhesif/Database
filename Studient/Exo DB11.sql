SELECT id, name
  CASE
    WHEN tot_cred < 30 THEN 'Freshman'
    WHEN tot_cred >= 30 AND tot_cred < 60 THEN 'Sophomore'
    WHEN tot_cred >= 60 AND tot_cred < 90 THEN 'Junior'
    WHEN tot_cred >= 90 AND tot_cred < 120 THEN 'Senior'
    ELSE 'Graduate'
  END AS status
  COUNT(ID)
FROM student;
  GROUP BY status;