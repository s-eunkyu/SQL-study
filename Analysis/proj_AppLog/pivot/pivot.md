# Pivot
세로로 길게 나열된 행 데이터를 특정 기준에 따라 열(Column) 형태로 변환하여 데이터를 요약하고 재배열하는 기능

## Pivot 사용 이유
1. 성능(퍼포먼스)
2. 사용이 쉬움
3. 데이터 시각화 도구에서 PIVOT한 형태를 지원

## Pivot 작성
- MAX, IF, GROUP BY 사용 (SUM, COUNT, ANY_VALUE 등)
```sql
SELECT
    student
  , MAX(IF(subject="수학", score, NULL)) AS 수학
  , MAX(IF(subject="영어", score, NULL)) AS 영어
  , MAX(IF(subject="과학", score, NULL)) AS 과학
FROM Table
GROUP BY
    student
```
