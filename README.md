# 방송통신대학교 통계/데이터학과 코드 저장소

## R - Jupyter 연동

1. RStudio 설치: https://rstudio.com/
2. Jupyter 연동: https://irkernel.github.io

맥에서 IRkernel을 설치할 때는 R 앱이 아니라 터미널로 실행해야 한다(주피터 패스를 못찾음).
```
$/Applications/R.app/Contents/MacOS/R (엔터)
```
그다음 R 콘솔에서 다음 명령을 실행한다.
```
install.packages('IRkernel')
IRkernel::installspec()
```
마지막으로 주피터 노트북을 실행하여 R 커널을 선택할 수 있는지 확인한다.

## 과목

### 2021년 1학기

1. [data_vis](data_vis): 데이터 시각화
2. [r_computing](r_computing): R 컴퓨팅
