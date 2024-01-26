-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/eaXw4L
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "collision" (
    "collision_id" INT   NOT NULL,
    "crash_date" DATE   NOT NULL,
    "crash_time" VARCHAR   NOT NULL,
    "borough" VARCHAR   NOT NULL,
    "latitude" INT   NOT NULL,
    "longitude" INT   NOT NULL,
    CONSTRAINT "pk_collision" PRIMARY KEY (
        "collision_id"
     )
);

CREATE TABLE "vehicle_info" (
    "collision_id" INT   NOT NULL,
    "vehicle_1" VARCHAR   NOT NULL,
    "vehicle_2" VARCHAR   NOT NULL,
    "vehicle_3" VARCHAR   NOT NULL,
    "contributing_vehicle_1" VARCHAR   NOT NULL,
    "contributing_vehicle_2" VARCHAR   NOT NULL,
    "contributing_vehicle_3" VARCHAR   NOT NULL
);

CREATE TABLE "people_affected" (
    "collision_id" INT   NOT NULL,
    "persons_injured" INT   NOT NULL,
    "persons_killed" INT   NOT NULL,
    "pedestrians_killed" INT   NOT NULL,
    "pedestrians_injured" INT   NOT NULL,
    "cyclist_injured" INT   NOT NULL,
    "cyclist_killed" INT   NOT NULL,
    "motorist_injured" INT   NOT NULL,
    "motorist_killed" INT   NOT NULL
);

ALTER TABLE "vehicle_info" ADD CONSTRAINT "fk_vehicle_info_collision_id" FOREIGN KEY("collision_id")
REFERENCES "collision" ("collision_id");

ALTER TABLE "people_affected" ADD CONSTRAINT "fk_people_affected_collision_id" FOREIGN KEY("collision_id")
REFERENCES "collision" ("collision_id");