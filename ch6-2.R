# 01. 환경설정 및 데이터 불러오기
library(nnet)
data(iris)

# nnet 종속변수 입력을 위한 종속변수 변환
species.ind <- class.ind(iris$Species)
iris <- cbind(iris, species.ind)

# 02. 훈련 및 검증 데이터 분리
train.idx  <-  sample(1:150,100)

iris.train.df <- iris[train.idx, ]
iris.test.df <- iris[-train.idx, ]

# 03. 신경망 모형 적합
iris.nn  <-  nnet(x=iris.train.df[,c(1:4)], y=iris.train.df[,c(6:8)], size=10, softmax=TRUE)

# 04. 검증 데이터 예측 및 모형 평가
# 훈련데이터
iris.pred <- predict(iris.nn, iris.train.df[,c(1:4)], type="class")
table(iris.pred, iris.train.df$Species)
# 검증데이터
iris.pred <- predict(iris.nn, iris.test.df[,c(1:4)], type="class")
table(iris.pred, iris.test.df$Species)

#05. 신경망 시각화
# 시각화 R 코드 함수 다운로드
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

# 신경망 모형 시각화
library(reshape2)
plot.nnet(iris.nn)