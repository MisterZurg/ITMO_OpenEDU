```sql
SELECT Test_Name_En FROM TEST WHERE Test_ID=4
```

|  TEST_NAME_EN  |
|:--------------:|
| Digital ethics |
1 rows returned in 0.01 seconds	


SELECT COUNT(*) FROM STUDENT_TEST WHERE Score=100 AND Test_ID=15


|COUNT(*)|
|:--------------:|
|941|
1 rows returned in 0.01 seconds	 



SELECT AVG(Score) FROM STUDENT_TEST JOIN TEST ON STUDENT_TEST.Test_ID=TEST.Test_ID WHERE Test_Name_En='Introduction to personal information security'

|AVG(SCORE)|
|:--------------:|
|97.803095442820292347377472055030094583|


SELECT MAX(Score)-MIN(Score) FROM STUDENT_TEST WHERE Test_ID=2 AND Student_ID IN (SELECT Student_ID FROM STUDENT WHERE GROUP_CODE='Z3143')

MAX(SCORE)-MIN(SCORE)
70
1 rows returned in 0.02 seconds	
