const databaseHost = process.env.DATABASE_HOST;
const databasePort = process.env.DATABASE_PORT;
const databaseUser = process.env.DATABASE_USER;
const databasePassword = process.env.DATABASE_PASSWORD;
const databaseName = process.env.DATABASE_NAME;
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log(`      databaseHost is ${databaseHost}`);
console.log(`      databasePort is ${databasePort}`);
console.log(`      databaseUser is ${databaseUser}`);
console.log(`      databasePassword is ${databasePassword}`);
console.log(`      databaseName is ${databaseName}`);
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log(`remoteUrl is => mongodb://${databaseUser}:${databasePassword}@${databaseHost}:${databasePort}/${databaseName}`);
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

module.exports = {
  //remoteUrl : 'mongodb://todo:bitnami@mongodb-primary:27017/todo',
  remoteUrl : `mongodb://${databaseUser}:${databasePassword}@${databaseHost}:${databasePort}/${databaseName}`,
  //remoteUrl : 'mongodb://0eb6bfe9-0ee0-4-231-b9ee:PpqNdxdyyys5nnQNA6SmPatk4NGkPlkLpUeqYz33ikQKTNDy4cma42500PCpt8S0GF9qm0hzv0R0FKglK3v03g==@0eb6bfe9-0ee0-4-231-b9ee.documents.azure.com:10255/?ssl=true',
  localUrl: 'mongodb://localhost/meanstacktutorials'
};
