# 注意，现在有两个nvm的版本，分别是20.10.0和16.15.1，可以通过命令：nvm ls/nvm list查看
# 20.10.0用于部署博客，16.15.1用于springboot框架课。只有前者包含hexo命令，使用后者的原因是支持旧版本的vue
# 可以使用命令：nvm use 20.10.0和nvm use 16.15.1在两个版本的nvm之间切换

hexo clean

hexo generate

hexo deploy