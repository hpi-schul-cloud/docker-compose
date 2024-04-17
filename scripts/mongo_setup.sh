#!/bin/bash
sleep 10

echo SETUP.sh time now: `date +"%T" `
mongo --host mongodb-primary:27017 --eval 'rs.initiate({_id: "rs0", members: [{_id: 0, host: "mongodb-primary:27017" }]})'
mongo --host mongodb-primary:27017 << EOF
  var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "mongodb-primary:27017",
        "priority": 2,
		"votes": 1
      },
      {
        "_id": 1,
        "host": "mongodb-secondary:27017",
        "priority": 0,
		"votes": 0
      },
      {
        "_id": 2,
        "host": "mongodb-arbiter:27017",
        "priority": 0,
		"votes": 0
      }
    ]
  };
  rs.reconfig(cfg, { force: true });
  db.getMongo().setReadPref('nearest');
EOF