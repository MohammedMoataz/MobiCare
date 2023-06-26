const { query } = require("express");
const url = require("url");
const { error } = require("console");
require("dotenv");

const db = require("../DB/exectuemysql");
const helper = require("../DB/helper");
const config = require("../DB/mysqlconfig");

class DoctorController {
  static getAllDoctors = async (req, res) => {
    try {
      let page = req.query.page;
      let limit = req.query.limit;
      let listPerPage = limit ? limit : config.listPerPage;

      const offset = helper.getOffset(page, listPerPage);
      const rows = await db.query(
        `call GET_ALL_DOCTORS(${offset},${listPerPage})`
      );
      const data = helper.emptyOrRows(rows);
      const totalNumber = data[0][0] ? data[0][0]["number_of_rows"] : 0;
      const count =
        totalNumber - offset > listPerPage
          ? listPerPage
          : totalNumber - offset > 0
            ? totalNumber - offset
            : 0;

      data[1]["offset"] = offset;
      data[1]["page"] = page;
      data[1]["count"] = count;
      data[1]["totalNumber"] = totalNumber;
      data[1]["limit"] = listPerPage;
      const hasmore = data != [] ? helper.hasmore(listPerPage, count) : false;
      data[1]["hasmore"] = hasmore;
      res.json({ message: "success fetched all doctors", data });
    } catch (error) {
      res.json({ message: "fail", error: error.message });
    }
  };

  static getDoctor = async (req, res) => {
    try {
      const rows = await db.query(`call GET_DOCTOR(${req.params.id})`);
      const data = helper.emptyOrRows(rows);

      res.json({ message: "success fetched  doctor", data });
    } catch (error) {
      res.json({ message: "fail", error: error.message });
    }
  };

  static addDoctor = async (req, res) => {
    const doctor = req.body;
    try {
      let DOCTOR_ADMIN_ID_V = doctor.ADMIN_ID;
      let DOCTOR_FIRST_NAME_V = doctor.DOCTOR_FIRST_NAME;
      let DOCTOR_LAST_NAME_V = doctor.DOCTOR_LAST_NAME;
      let DOCTOR_EMAIL_V = doctor.DOCTOR_EMAIL ? doctor.DOCTOR_EMAIL : null;
      let DOCTOR_PASS_V = req.body.DOCTOR_PASSWORD;
      let ADDRESS_V = doctor.ADDRESS;
      let GENDER_V = req.body.GENDER;
      let DOB_V = req.body.DOB;
      let SPECIALIZATION_V = req.body.SPECIALIZATION;
      let PHONE_V = req.body.PHONE;
      let PHOTO_V = req.body.PHOTO ? doctor.PHOTO : null;

      if (!DOCTOR_EMAIL_V) {
        DOCTOR_EMAIL_V = helper.doctorEmailGenerator(
          DOCTOR_FIRST_NAME_V,
          DOCTOR_LAST_NAME_V
        );
      }
      const HASHED_PASSWORD_V = await helper.hashingPassword(DOCTOR_PASS_V);
      const rows = await db.query(
        `call ADD_NEW_DOCTOR(${DOCTOR_ADMIN_ID_V},'${DOCTOR_FIRST_NAME_V}','${DOCTOR_LAST_NAME_V}','${DOCTOR_EMAIL_V}',${HASHED_PASSWORD_V},'${ADDRESS_V}',${GENDER_V},'${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}','${PHOTO_V}')`
      );
      const data = helper.emptyOrRows(rows);
      res.json({ message: "Success DOCTOR IS ADDED", data });
    } catch (error) {
      res.json({ message: "failed Process", error: error.message });
    }
  };

  static addFUID = async (req, res) => {
    const doctor = req.body

    try {
      let doctor_id = doctor.id
      let FUID = doctor.fuid

      await db.query(
        `UPDATE mobicare.sys_doctor
                SET FUID = '${FUID}'
                WHERE(ID = ${doctor_id});`
      )

      res.json({ message: "Success FUID is added" })

    } catch (error) {
      res.json({ message: "Failed process", error: error.message })

    }
  }

  static editDoctor = async (req, res) => {
    const doctor = req.body;

    try {
      let DOCTOR_ID_V = req.params.id ? req.params.id : req.ID;
      let DOCTOR_FUID_V = doctor.FUID ? req.body.FUID : null;
      let DOCTOR_STATUS_V = doctor.STATUS ? doctor.STATUS : null;
      let DOCTOR_ADMIN_ID_V = doctor.ADMIN_ID ? doctor.ADMIN_ID : null;
      let DOCTOR_FIRST_NAME_V = doctor.DOCTOR_FIRST_NAME
        ? doctor.DOCTOR_FIRST_NAME
        : null;
      let DOCTOR_LAST_NAME_V = doctor.DOCTOR_LAST_NAME
        ? doctor.DOCTOR_LAST_NAME
        : null;
      let DOCTOR_EMAIL_V = req.body.DOCTOR_EMAIL ? doctor.DOCTOR_EMAIL : null;
      let DOCTOR_PASS_V = req.body.DOCTOR_PASSWORD
        ? doctor.DOCTOR_PASSWORD
        : null;
      let ADDRESS_V = doctor.ADDRESS ? doctor.ADDRESS : null;
      let GENDER_V = req.body.GENDER ? doctor.GENDER : null;
      let DOB_V = req.body.DOB ? doctor.DOB : null;
      let SPECIALIZATION_V = req.body.SPECIALIZATION
        ? doctor.SPECIALIZATION
        : null;
      let PHONE_V = req.body.PHONE ? doctor.PHONE : null;
      let BIO_V = req.body.BIO ? doctor.BIO : null;
      let PHOTO_V = req.body.PHOTO ? doctor.PHOTO : null;
      let VIDEO_V = req.body.VIDEO ? doctor.VIDEO : null;


      if (DOCTOR_PASS_V)
        DOCTOR_PASS_V = await helper.hashingPassword(DOCTOR_PASS_V);

      const rows = await db.query(
        `call EDIT_DOCTOR(${DOCTOR_ID_V},'${DOCTOR_FUID_V}','${DOCTOR_STATUS_V}',${DOCTOR_ADMIN_ID_V},'${DOCTOR_FIRST_NAME_V}','${DOCTOR_LAST_NAME_V}','${DOCTOR_EMAIL_V}',${DOCTOR_PASS_V},'${ADDRESS_V}','${GENDER_V}','${DOB_V}','${SPECIALIZATION_V}','${PHONE_V}','${PHOTO_V}','${VIDEO_V}','${BIO_V}')`
      );
      const data = helper.emptyOrRows(rows);

      if (data['affectedRows']) {
        const rows = await db.query(`call GET_DOCTOR(${DOCTOR_ID_V})`);
        const data = helper.emptyOrRows(rows);
        delete data[0][0].Refresh_Token_Value
        delete data[0][0].Pass

        res.json({ message: "Success DOCTOR IS MODIFIED", data: data[0] });
      } else {
        throw new error
      }
    } catch (error) {
      res.json({ message: "failed Process", error: error.message });
    }
  };

  static searchDoctorByName = async (req, res) => {
    let doctor = req.query;
    console.log(doctor);
    try {
      let DOCTOR_FIRST_NAME_V = doctor.FN ? doctor.FN : null;
      let DOCTOR_LAST_NAME_V = doctor.LN ? doctor.LN : null;

      let query;
      if (DOCTOR_LAST_NAME_V == null) {
        query = `F_Name LIKE '${DOCTOR_FIRST_NAME_V}%'`;
      } else {
        query = `F_Name LIKE '${DOCTOR_FIRST_NAME_V}%' and L_Name LIKE '${DOCTOR_LAST_NAME_V}%'`;
      }

      const rows = await db.query(`select * from sys_doctor where ${query}`);

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      res.json({ message: "failed Process", error: error.message });
    }
  };

  static searchDoctorBySpecialization = async (req, res) => {
    let doctor = req.query;

    try {
      let SPECIALIZATION_V = doctor.SPECIALIZATION ? doctor.SPECIALIZATION : null;

      const rows = await db.query(
        `select * from sys_doctor where Specialization LIKE '${SPECIALIZATION_V}%' `
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      console.log(error.error);
      res.json({ message: "failed Process" });
    }
  };

  static addDoctorPatient = async (req, res) => {
    try {
      let PATIENT_ID_V = req.body.PATIENT_ID ? req.body.PATIENT_ID : null;
      let DOCTOR_ID_V = req.body.DOCTOR_ID ? req.body.DOCTOR_ID : null;

      const rows = await db.query(
        `insert into sys_patient_has_doctor (Patient_ID , Doctor_ID) VALUES (${PATIENT_ID_V}, ${DOCTOR_ID_V}) `
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      console.log(error);
      res.json({ message: "failed Process" });
    }
  };

  static getDoctorPatients = async (req, res) => {
    try {
      let DOCTOR_ID_V = req.params.id ? req.params.id : null;

      const rows = await db.query(
        `select Patient_ID, Patient_Status, FUID, F_Name, L_Name, Email,Address, Gender, DOB, Weight, Height,Photo, Phone from mobicare.sys_patient_has_doctor JOIN mobicare.sys_patient ON mobicare.sys_patient_has_doctor.Patient_ID=mobicare.sys_patient.ID  where Doctor_ID = ${DOCTOR_ID_V} ;`
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      console.log(error);
      res.json({ message: "failed Process" });
    }
  };

  static getNote = async (req, res) => {
    try {
      let DOCTOR_ID_V = req.query.DOCTOR_ID ? req.query.DOCTOR_ID : req.ID;
      let PATIENT_ID_V = req.query.PATIENT_ID ? req.query.PATIENT_ID : null;

      console.log(DOCTOR_ID_V, PATIENT_ID_V)
      const rows = await db.query(
        `select * from mobicare.sys_note where Doctor_ID = ${DOCTOR_ID_V} AND Patient_ID=${PATIENT_ID_V} ;`
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      console.log(error);
      res.json({ message: "failed Process" });
    }
  }

  static addNote = async (req, res) => {
    try {
      let PATIENT_ID_V = req.body.PATIENT_ID ? req.body.PATIENT_ID : null
      let DOCTOR_ID_V = req.body.DOCTOR_ID ? req.body.DOCTOR_ID : null
      let NOTE_V = req.body.NOTE ? req.body.NOTE : null
      let currentDate = await helper.getCurrent()

      const rows = await db.query(
        `INSERT INTO sys_note (Doctor_ID , Patient_ID, NoteContent , Creation_Date) VALUES (${DOCTOR_ID_V}, ${PATIENT_ID_V},'${NOTE_V}','${currentDate}' )`
      )

      const data = helper.emptyOrRows(rows)

      if (data['affectedRows']) {
        const rows = await db.query(`select * from mobicare.sys_note where Doctor_ID = ${DOCTOR_ID_V} AND Patient_ID=${PATIENT_ID_V} ;`);
        const data = helper.emptyOrRows(rows);
        res.json({ message: "Success added noted", data })
      } else {
        throw new error
      }

    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static editNote = async (req, res) => {
    try {
      let NOTE_ID_V = req.body.NOTE_ID ? req.body.NOTE_ID : null
      let PATIENT_ID_V = req.body.PATIENT_ID ? req.body.PATIENT_ID : null
      let DOCTOR_ID_V = req.body.DOCTOR_ID ? req.body.DOCTOR_ID : null
      let NOTE_V = req.body.NOTE ? req.body.NOTE : null
      let currentDate = await helper.getCurrent()

      const rows = await db.query(
        `UPDATE sys_note SET Doctor_ID=${DOCTOR_ID_V} , Patient_ID=${PATIENT_ID_V}, NoteContent = '${NOTE_V}' , Creation_Date ='${currentDate}' where Note_ID = ${NOTE_ID_V} `
      )

      const data = helper.emptyOrRows(rows)

      if (data['affectedRows']) {
        const rows = await db.query(`select * from mobicare.sys_note where Doctor_ID = ${DOCTOR_ID_V} AND Patient_ID=${PATIENT_ID_V} ;`);
        const data = helper.emptyOrRows(rows);
        res.json({ message: "Success modified note", data })
      } else {
        throw new error
      }

    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static delNote = async (req, res) => {
    try {
      let PATIENT_ID_V = req.body.PATIENT_ID ? req.body.PATIENT_ID : null
      let DOCTOR_ID_V = req.body.DOCTOR_ID ? req.body.DOCTOR_ID : null
      let NOTE_V = req.body.NOTE ? req.body.NOTE : null
      let currentDate = await helper.getCurrent()

      const rows = await db.query(
        `DELETE FROM sys_note where Doctor_ID = ${DOCTOR_ID_V} AND Patient_ID=${PATIENT_ID_V} `
      )

      const data = helper.emptyOrRows(rows)
      res.json({ message: "Success deleted note", data })

    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static DoctorSearchPatientsByName = async (req, res) => {
    let patient = req.query;
    try {

      let PATIENT_FIRST_NAME_V = patient.FN ? patient.FN : null;
      let PATIENT_LAST_NAME_V = patient.LN ? patient.LN : null;

      let query;
      if (PATIENT_LAST_NAME_V == null) {
        query = `sys_patient.F_Name LIKE '${PATIENT_FIRST_NAME_V}%'`;
      } else {
        query = `sys_patient.F_Name LIKE '${PATIENT_FIRST_NAME_V}%' and sys_patient.L_Name LIKE '${PATIENT_LAST_NAME_V}%'`;
      }

      const rows = await db.query(`select  Patient_ID, Patient_Status, FUID, F_Name, L_Name, Email,Address, Gender, DOB, Weight, Height,Photo, Phone
        from mobicare.sys_patient
        JOIN mobicare.sys_patient_has_doctor
        ON mobicare.sys_patient_has_doctor.Patient_ID=mobicare.sys_patient.ID 
        where sys_patient_has_doctor.Doctor_ID = ${req.ID} AND ${query}`);

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      res.json({ message: "failed Process", error: error.message });
    }
  };

  static getVideo = async (req, res) => {
    try {
      let DOCTOR_ID_V = req.params.DOCTOR_ID ? req.params.DOCTOR_ID : req.ID;

      const rows = await db.query(
        `select * from mobicare.sys_videos where Doctor_ID = ${DOCTOR_ID_V}`
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {
      console.log(error);
      res.json({ message: "failed Process" });
    }
  }

  static addVideo = async (req, res) => {
    try {
      let DOCTOR_ID_V = req.ID
      let VIDEO_URL_V = req.body.VIDEO_URL ? req.body.VIDEO_URL : null
      let VIDEO_DESC_V = req.body.VIDEO_DESC ? req.body.VIDEO_DESC : null
      let CURRENTDATE_V = await helper.getCurrent();

      const rows = await db.query(
        `INSERT INTO sys_videos (Doctor_ID , VIDEO_URL , Video_Desc ,CreationDate) VALUES (${DOCTOR_ID_V}, '${VIDEO_URL_V}', '${VIDEO_DESC_V}','${CURRENTDATE_V}') ;`
      )

      const data = helper.emptyOrRows(rows)

      if (data['affectedRows']) {
        const rows = await db.query(`select * from mobicare.sys_videos where Doctor_ID = ${DOCTOR_ID_V} ;`);
        const data = helper.emptyOrRows(rows);
        res.json({ message: "Success added video", data })
      } else {
        throw new error
      }

    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static editVideo = async (req, res) => {
    try {
      let VIDEO_ID_V = req.body.VIDEO_ID ? req.body.VIDEO_ID : null
      let DOCTOR_ID_V = req.ID
      let VIDEO_URL_V = req.body.VIDEO_URL ? req.body.VIDEO_URL : null
      let VIDEO_DESC_V = req.body.VIDEO_DESC ? req.body.VIDEO_DESC : null
      let VIDEO_CREATIONDATE_V = await helper.getCurrent()

      const rows = await db.query(
        `UPDATE sys_videos SET Video_URL ='${VIDEO_URL_V}' , Video_Desc ='${VIDEO_DESC_V}' where Video_ID = ${VIDEO_ID_V} AND Doctor_ID= ${DOCTOR_ID_V} `
      )

      const data = helper.emptyOrRows(rows)

      if (data['affectedRows']) {
        const rows = await db.query(`select * from mobicare.sys_videos where Doctor_ID = ${DOCTOR_ID_V} ;`);
        const data = helper.emptyOrRows(rows);
        res.json({ message: "Success modified note", data })
      } else {
        throw new error
      }

    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static delVideo = async (req, res) => {
    try {
      let DOCTOR_ID_V = req.ID
      let VIDEO_ID_V = req.params.id ? req.params.id : null

      const rows = await db.query(
        `DELETE FROM sys_videos where Video_ID = ${VIDEO_ID_V} AND Doctor_ID=${DOCTOR_ID_V};`
      )

      const data = helper.emptyOrRows(rows)

      if (data['affectedRows']) {
        const rows = await db.query(`select * from mobicare.sys_videos where Doctor_ID = ${DOCTOR_ID_V} ;`);
        const data = helper.emptyOrRows(rows);
        res.json({ message: "Success added video", data })

      } else {
        throw new error
      }
    } catch (error) {
      res.json({ message: "failed Process", error: error.message })
    }
  }

  static getAllVideo = async (req, res) => {
    try {
      const rows = await db.query(
        `select mobicare.sys_videos.*,mobicare.sys_doctor.F_Name ,mobicare.sys_doctor.L_Name ,mobicare.sys_doctor.Gender 
          from mobicare.sys_videos JOIN sys_doctor 
          ON mobicare.sys_doctor.ID = mobicare.sys_videos.Doctor_ID `
      );

      const data = helper.emptyOrRows(rows);
      res.json({ message: "Result", data });
    } catch (error) {

      res.json({ message: "failed Process" });
    }
  }
}

module.exports = DoctorController;
