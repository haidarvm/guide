# forerever

# start 
forever start app.js 
forever start app.js index.js


# list
forever list

# stop
forever stop 0
// or
forever stop index.js
// or
forever stop ehbz
// or
forever stop 8196



# forever start service
forever start --uid newapp index.js


# forever stop service
forever stop newapp

# stop all
forever stopall

# forever restart id
forever restart 0
