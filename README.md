
# RTHON2020

<!-- badges: start -->
<!-- badges: end -->

![](https://www.oss.kr/editor/file/c14fc9a0/download/ad6c07c4-04f1-4983-90ef-8c67f7351c3a)


## R 패키지 프로젝트 만들기

```r
usethis::create_package("PATH/package_name")

## example: package name - RTHON2020
usethis::create_package("~/Lecture/RTHON2020")
```

해당 프로젝트로 RStudio 가 재시작된다. 

## R에서 깃헙 Repository 만들기

먼저 git 을 활성화한다.

```r
usethis::use_git()
```

![](fig/use_git.png)

위 그림처럼 RStudio 를 재시작하자. 이제 깃헙 Repository 를 만들고, 여기에 파일들을 올리자. 먼저 아래 명령어를 실행한다.

```r
usethis::use_github()
```

![](fig/use_github1.png)


깃헙토큰이 없다는 메시지가 뜰 것이다. 메시지 내용대로 `browse_github_token()` 를 실행해서 깃헙 토큰을 등록하고 그 번호를 기억하자.

```r
usethis::browse_github_token()
```

깃헙 홈페이지 새창이 뜨고 비밀번호를 입력하면, Token 만드는 화면으로 이동한다. 적당한 이름으로 토큰 만든 후 아래 generate token 버튼을 누르면 토큰번호가 보이는데, 이것을 복사해놓자.


이제 이 토큰번호를 R 환경변수로 넣어야 한다. `edit_r_environ()` 로 **.Renviron** 을 연 후 아래처럼 입력한 후 저장하자(xxxyyyzzz 대신 토큰번호).

```sh
## .Renviron
GITHUB_PAT=xxxyyyzzz
```

이제 다시 `usethis::use_github()` 를 실행하면 Repository 가 만들어진다. 본인 깃헙 계정에서 만들어진 것을 확인하자.





