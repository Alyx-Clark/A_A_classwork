const express = require("express");
const app = express();
const mongoose = require('mongoose');
const db = require('./config/keys').mongoURI;
const bodyParser = require('body-parser');
const users = require("./routes/api/users");
const tweets = require("./routes/api/tweets");
const User = require('./models/User');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(bodyParser.json());


app.get("/", (req, res) => {
    const user = new User({
        handle: "jim",
        email: "jim@jim.jim",
        password: "jimisgreat123"
    })
    user.save()
    res.send("Hello world")
});


app.use("/api/users", users )
app.use("/api/tweets", tweets )

const port = process.env.PORT || 5500;

app.listen(port, () => {console.log(`listening on port ${port}`)})

