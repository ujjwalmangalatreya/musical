const {Pool}  = require('pg')

const pool = new Pool({
    user : '',
    password : 'ujjwal',
    host : 'localhost',
    database : 'postgres',
    port: 5432,
})


pool.on('connect',()=>{
    console.log("Connected to Postgres SQL database")
})
// Log an error message if there's a connection error
pool.on('error', (err, client) => {
    console.error('Error connecting to PostgreSQL database:', err);
});


module.exports ={
    query :(text,params) => pool.query(text,params),
}