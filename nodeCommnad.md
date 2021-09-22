# node 관련 기본 명령어

```sh
npm init
npm init -y     //기본 설정으로 인스톨

npm outdated
npm update
npm audit fix

yarn start
yarn run fix

yarn global add serve
serve -s build

npm start
npm install --save
npm install -D webpack webpack-cli
npm install @babel/core @babel/cli
npm i -D eslint
npm i -D prettier
npm i -D eslint-config-prettier
npm i -D eslint-plugin-prettier
npm i husky
npm i lint-staged
npm i lodash.throttle

npx serve -s ./build  # -s 어떤 라우팅도 index.html 로 spa 옵션
npx lite-server
npx babel app.js --plugins './my-babel-plugin.js'
npx webpack --config webpack.dll.config.js
npx eslint --fix src/**/*.js
npx cross-env NODE_ENV=development
npx eslint app.js --fix
npx eslint --init
npx prettier --write
npx husky install
npx husky add .husky/pre-commit "npm test", "npx lint-staged"


nvm use version-name
nvm list
nvm --version
nvm uninstall version-name
nvm ls-remote
nvm alias default version-name // 버전 기본값 설정

open index.html

node_modules/.bin/webpack --mode development --entry ./src/app.js --output dist/main.js

# yarn berry 쓰기
yarn set version berry
yarn install
yarn add ${packageName} --dev
yarn up ${packageName}@[version or tag]
yarn remove ${packageName}
```
