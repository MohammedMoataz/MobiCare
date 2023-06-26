const db = require('../DB/exectuemysql')
const helper = require('../DB/helper')
const config = require('../DB/mysqlconfig')

class PatientController {
    
    static getAllPatients = async (req, res) => {
        try {
            let page = req.query.page
            let limit = req.query.limit
            let listPerPage = limit ? limit : config.listPerPage

            const offset = helper.getOffset(page, listPerPage)
            const rows = await db.query(
                `call GET_ALL_PATIENTS(${offset},${listPerPage})`
            )

            const data = helper.emptyOrRows(rows)
            const totalNumber = (data[0][0] ? data[0][0]['number_of_rows'] : 0)
            const count = (totalNumber) - offset > listPerPage ? listPerPage : (totalNumber) - offset > 0 ? (totalNumber) - offset : 0
            
            data[1]['offset'] = offset
            data[1]['page'] = page
            data[1]['count'] = count
            data[1]['totalNumber'] = totalNumber
            data[1]['limit'] = listPerPage
            
            const hasmore = data != [] ? helper.hasmore(listPerPage, count) : false
            data[1]['hasmore'] = hasmore
    
            res.json({ message: "success fetched all patients", data })

        } catch (error) {
            res.json({ message: "fail", error: error.message })

        }
    }

    static getPatient = async (req, res) => {
        let patient_id = req.params.id

        try {
            let patient_data = await db.query(
                `call GET_PATIENT(${patient_id})`
            )
            patient_data = helper.emptyOrRows(patient_data)

            let patinet_symptoms = await db.query(
                `SELECT *
                    FROM patient_symptoms 
                    WHERE patient_id = '${patient_id}';`
            )
            patinet_symptoms = helper.emptyOrRows(patinet_symptoms)

            let patinet_doctors = await db.query(
                `select Doctor_ID, Doctor_Status, FUID, F_Name, L_Name, Email, Address, Gender, DOB, Specialization, Phone, Photo, Bio
                from mobicare.sys_patient_has_doctor
                JOIN mobicare.sys_doctor
                ON mobicare.sys_patient_has_doctor.Doctor_ID = mobicare.sys_doctor.ID 
                where Patient_ID = ${patient_id};`
            )
            patinet_doctors = helper.emptyOrRows(patinet_doctors)


            let data = patient_data[0][0]
            data.symptoms = patinet_symptoms
            data.doctors = patinet_doctors

            res.json({ message: "success fetched patient", data })

        } catch (error) {
            res.json({ message: "failed process", error: error.message })

        }
    }

    static addPatient = async (req, res) => {
        const patient = req.body
        console.log(patient)

        try {
            let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME
            let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME
            let PATIENT_EMAIL_V = patient.PATIENT_EMAIL
            let PATIENT_PASS_V = patient.PATIENT_PASSWORD
            let PATIENT_PHONE_V = patient.PATIENT_PHONE
            let PATIENT_ADDRESS_V = patient.PATIENT_ADDRESS
            let PATIENT_GENDER_V = patient.PATIENT_GENDER
            let DOB_V = patient.DOB

            const HASHED_PASSWORD_V = await helper.hashingPassword(PATIENT_PASS_V)

            const rows = await db.query(
                `call ADD_NEW_PATIENT('${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}',${HASHED_PASSWORD_V},'${PATIENT_ADDRESS_V}','${PATIENT_PHONE_V}','${PATIENT_GENDER_V}','${DOB_V}')`
            )

            const data = helper.emptyOrRows(rows)
            res.json({ message: "Success PATIENT IS ADDED", data })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message })

        }
    }

    static addFUID = async (req, res) => {
        const patient = req.body

        try {
            let patient_id = patient.id
            let FUID = patient.fuid

            await db.query(
                `UPDATE mobicare.sys_patient
                    SET FUID = '${FUID}'
                    WHERE(ID = ${patient_id});`
            )

            res.json({ message: "Success FUID is added" })

        } catch (error) {
            res.json({ message: "Failed process", error: error.message })

        }
    }

    static editPatient = async (req, res) => {
        const patient = req.body

        try {
            let PATIENT_ID_V = req.params.id ? req.params.id : req.ID
            let PATIENT_FUID_V = patient.FUID ? req.body.FUID : null
            let PATIENT_STATUS_V = patient.STATUS ? req.body.STATUS : null
            let PATIENT_FIRST_NAME_V = patient.PATIENT_FIRST_NAME ? req.body.PATIENT_FIRST_NAME : null
            let PATIENT_LAST_NAME_V = patient.PATIENT_LAST_NAME ? req.body.PATIENT_LAST_NAME : null
            let PATIENT_EMAIL_V = req.body.PATIENT_EMAIL ? req.body.PATIENT_EMAIL : null
            let PATIENT_PASS_V = req.body.PATIENT_PASSWORD ? req.body.PATIENT_PASSWORD : null
            let PATIENT_ADDRESS_V = patient.PATIENT_ADDRESS ? req.body.PATIENT_ADDRESS : null
            let PATIENT_PHONE_V = req.body.PATIENT_PHONE ? req.body.PATIENT_PHONE : null
            let DOB_V = req.body.DOB ? req.body.DOB : null
            let PATIENT_WEIGHT_V = req.body.PATIENT_WEIGHT ? req.body.PATIENT_WEIGHT : null
            let PATIENT_HEIGHT_V = req.body.PATIENT_HEIGHT ? req.body.PATIENT_HEIGHT : null
            let PATIENT_PHOTO_V = req.body.PATIENT_PHOTO ? req.body.PATIENT_PHOTO : null

            if (PATIENT_PASS_V) {
                PATIENT_PASS_V = await helper.hashingPassword(PATIENT_PASS_V)
            }

            const rows = await db.query(
                `call EDIT_PATIENT(${PATIENT_ID_V},'${PATIENT_FUID_V}','${PATIENT_STATUS_V}','${PATIENT_FIRST_NAME_V}','${PATIENT_LAST_NAME_V}','${PATIENT_EMAIL_V}',${PATIENT_PASS_V},'${PATIENT_ADDRESS_V}','${PATIENT_PHONE_V}','${DOB_V}','${PATIENT_WEIGHT_V}','${PATIENT_HEIGHT_V}','${PATIENT_PHOTO_V}')`
            )
            const data = helper.emptyOrRows(rows)

            if (data['affectedRows']) {
                const rows = await db.query(`call GET_PATIENT(${PATIENT_ID_V})`);
                const data = helper.emptyOrRows(rows);

                res.json({ message: "Success PATIENT IS MODIFIED", data: data[0] })
            } else {
                throw new error
            }

        } catch (error) {
            res.json({ message: "failed Process", error: error.message })

        }
    }

    static addSymptom = async (req, res) => {
        const patient = req.body

        try {
            let patient_id = patient.id
            let symptom = patient.symptom ? patient.symptom : null

            db.query(
                `INSERT INTO patient_symptoms (patient_id, symptom) VALUES (${patient_id}, '${symptom}')`
            )
                .then(async () => {
                    let rows = await db.query(
                        `SELECT *
                        FROM patient_symptoms 
                        WHERE patient_id = '${patient_id}';`
                    )

                    let data = helper.emptyOrRows(rows)
                    res.json({ message: "Success added symptom", data })
                })
                .catch(error => {
                    res.json({ error: error.message })
                })
        } catch (error) {
            res.json({ message: "failed Process", error: error.message })
        }
    }

    static getSymptoms = async (req, res) => {
        let patient_id = req.query.id

        try {
            let rows = await db.query(
                `SELECT *
                    FROM patient_symptoms 
                    WHERE patient_id = '${patient_id}';`
            )

            let data = helper.emptyOrRows(rows)
            res.json({ message: "Success got symptoms", data })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message })
        }
    }

    static deleteSymptom = async (req, res) => {
        const patient = req.query

        try {
            let patient_id = patient.id
            let symptom = patient.symptom ? patient.symptom : null

            const rows = await db.query(
                `DELETE 
                    FROM mobicare.patient_symptoms 
                    WHERE symptom = '${symptom}' and patient_id = ${patient_id};`
            )

            const data = helper.emptyOrRows(rows)
            res.json({ message: "Success deleted symptom", data })

        } catch (error) {
            res.json({ message: "failed Process", error: error.message })
        }
    }

    static getDoctors = async (req, res) => {
        try {
            let patient_id = req.query.id ? req.query.id : null

            const rows = await db.query(
                `select Doctor_ID, Doctor_Status, FUID, F_Name, L_Name, Email, Address, Gender, DOB, Specialization, Phone, Photo, Bio
                from mobicare.sys_patient_has_doctor
                JOIN mobicare.sys_doctor
                ON mobicare.sys_patient_has_doctor.Doctor_ID = mobicare.sys_doctor.ID 
                where Patient_ID = ${patient_id};`
            )

            const data = helper.emptyOrRows(rows)
            res.json({ message: "Success get doctors", data })

        } catch (error) {
            console.log(error)
            res.json({ message: "failed Process" })
        }
    }
}

module.exports = PatientController