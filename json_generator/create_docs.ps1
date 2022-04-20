# Required tools for setup
$_pwd=$pwd.path
pushd "${_pwd}/../schemas/"
json-dereference -s networks.schema.json  -o "${_pwd}/src/Schema/resolved.schema.json"
popd
# rm -R .\public\documentation\ 
Remove-Item .\public\documentation\ -ErrorAction SilentlyContinue  -Recurse -Force
mkdir .\public\documentation\ 
generate-schema-doc ./src/Schema/resolved.schema.json ./public/documentation/index.html

npm install
npm run build
Remove-Item ..\docs\* -ErrorAction SilentlyContinue   -Recurse -Force
mv  ./build/* ../docs
