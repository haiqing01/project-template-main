# use Github in R #

install.packages("usethis")
install.packages("gitcreds")

usethis::use_git_config(user.name="haiqing01", user.email="h.zhong1015@gmail.com")

# introduce my computer to Git #

usethis::create_github_token()
gitcreds::gitcreds_set()

# initialize git #

usethis::use_git()

# connect the project to github #

usethis::use_github()

# remove origin remote #
usethis::use_git_remote("origin", url = NULL, overwrite = TRUE)