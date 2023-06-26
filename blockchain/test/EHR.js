var EHR = artifacts.require("./EHR.sol");

contract("EHR", function (accounts) {
  it("should assert true", async function () {
    EHR.deployed()
        .then(() => assert.isTrue(true))
        .catch(() => assert.isTrue(false))
  })

  it("should add record", async function () {
    const EHR_instance = await EHR.deployed()

    await EHR_instance.addRecord(
      "1st",
      "first file",
      accounts[1]
    )

    await EHR_instance.addRecord(
      "2nd",
      "seconf file",
      accounts[1]
    )

    return assert.isTrue(true)
  })

  it("should retrieve records of a patient", async function () {
    const EHR_instance = await EHR.deployed()

    records = await EHR_instance.getRecords(accounts[1])

    console.log({ records })
    return records
  })
})
