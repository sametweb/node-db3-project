const db = require("../data/dbConfig");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(scheme_id) {
  return db
    .select("steps.id", "step_number", "instructions", "scheme_name")
    .from("steps")
    .join("schemes", "steps.scheme_id", "schemes.id")
    .where({ scheme_id })
    .orderBy("step_number", "asc");
}

function add(schemeData) {
  return db("schemes")
    .insert(schemeData, "id")
    .then(([id]) => {
      return db("schemes").where({ id }).first();
    });
}

function addStep(step, scheme_id) {
  return db("steps")
    .insert({ ...step, scheme_id }, "id")
    .then(([id]) => {
      return db("steps").where({ id }).first();
    });
}

function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id })
    .then((updated) => {
      return updated ? db("schemes").where({ id }).first() : null;
    });
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .first()
    .then((ifExists) => {
      return ifExists ? db("schemes").del().where({ id }) : null;
    });
}
