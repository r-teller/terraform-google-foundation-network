# Required tools for setup
pwd=$(pwd)
pushd "${pwd}/../schemas/"
json-dereference -s networks.schema.json  -o "${pwd}/src/Schema/resolved.schema.json"
popd
rm -rf ./public/documentation/*
generate-schema-doc ./src/Schema/resolved.schema.json ./public/documentation/index.html

npm install
npm run build
rm -rf ../docs/*
cp -r ./build/* ../docs
# rm .\public\documentation\*
