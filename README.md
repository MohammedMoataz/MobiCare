# MobiCare

# ![logo](https://github.com/MohammedMoataz/MobiCare/assets/81831838/2e8b1962-d912-4a38-b01d-2265144bbf8b "MobiCare logo") MobiCare

#### MobiCare healthcare system uses smart contracts to handle procedure records and stores medical records in BlockChain.

MobiCare is a mobile application, It facilitates the methods of consultation and follow-up between doctors and their patients.
It includes all required data about the patient including prescriptions, medical reports, radiology images, diagnoses, treatment plans, allergies, laboratory results, etc…, the patient is allowed to check them whenever he wants and also he can give access to his doctor to get and upload his medical records.
The system also provides the patient with an alarm for medication appointments, where he is reminded of the date of each medication that he has entered.
The application also allows doctors to upload videos that help spread awareness for users throughout the application and also allows the patient to like and write comments on these videos.

---

# MobiCare System Architecture

## Generic System Architecture
![MobiCare System Architecture-Generic](https://github.com/MohammedMoataz/MobiCare/assets/81831838/a3db56b1-fced-4c63-9260-585cac7c147a)

As we see, MobiCare has many components and uses many technologies to store its data.
So, we can explain MobiCare architecture in four main components/technologies:
- Mobile Application.
- Relational Database.
- Document Data Store.
- BlockChain.


## Mobile Architecture
<img src="https://github.com/MohammedMoataz/MobiCare/assets/81831838/dd5e8ead-9ef9-4bcb-a1f4-b3b66562ecca" alt="Mobile Architecture" height="500px" />

MVVM (Model-View-ViewModel)
MVVM is useful to move business logic from view to ViewModel and Model. ViewModel is the mediator between View and Model which carry all user events and return back the result.
The key benefits of using MVVM are
Business logic is separate from UI.
The view is independent from the ViewModel class and only reads the state from ViewModel
Code will be easy to maintain and update in terms of logic & UI
Easy to Write the test cases for the project


## Server-Side Architecture
<img src="https://github.com/MohammedMoataz/MobiCare/assets/81831838/d5b304b8-68be-4484-9d0c-1bddfd505125" alt="Server-Side Architecture" height="500px" />

We worked with MVC architecture (Model, View, and Controller) by replacing the view part with REST APIs.
Also, the server-side provides us with an authentication system that verifies the permission of each role (patient, doctor, and admin).
- Model is the data part.
- View is the REST APIs part.
- Controller is the request-response handler.


## Document Data Store
<img src="https://github.com/MohammedMoataz/MobiCare/assets/81831838/2ffc7a81-8fd1-4d80-b783-61da7e462e30" alt="Document Data Store" height="500px" />

We used the Firestore feature in the Firebase - which is (BaaS) - as a document data store and authentication system.
Firebase Firestore provides many features:
- application layers
- unidirectional data flow
- mutable and immutable state
- stream-based architecture

It facilitates dealing with data in several ways:
Adding new features becomes easier because you can build upon the foundation that you already have.
The codebase becomes easier to understand, and you're likely to spot some recurring patterns and conventions as you read the code.
Components have clear responsibilities and don't do too many things. This happens by design if your architecture is highly composable.
Entire classes of problems go away (more on this later).
You can have different kinds of components, by defining separate application layers for different areas of concern (UI, logic, services)


## BlockChain Environment
<img src="https://github.com/MohammedMoataz/MobiCare/assets/81831838/04b35763-d209-40bf-b92f-f2068246668b" alt="BlockChain Environment" height="500px" />

To connect to the blockchain network we used:
#### In the local environment:
- Truffle: Building the smart contracts. compile and deploy our smart contracts. Dealing with our smart contracts.
- Ganache: Local blockchain network. Deploying our smart contract. Providing test accounts.

#### Providers to deploy on blockchain network:
- Infura: Providing test Ethereum to deal with the blockchain network. Providing rpcURL and wsURL to our blockchain project.
- MetaMask: Private Wallet to deal with blockchain activities. Connected to Flutter to deal with the blockchain network.

#### Blockchain Network:
- Sepolia Test Network: Deployed our smart contract on. Our blockchain network deals with our smart contract.
- Ethereum: The main network and the main cryptocurrency which our smart contract deals with. Any transaction created in the Sepolia test network must pay gas fees with Ethereum cryptocurrency.
- IPFS (Interplanetary File System): which we use to store our sensitive data - medical records - and respond with cid (content identifier), and then we store this cid in the blockchain network with the patient’s wallet address to access it when he wants.
- Web3.Storage: like Infura, it helps us to deal with IPFS to store and access our files in the IPFS Distributed network. It's a bridge between us and IPFS.

---

# Demo

#### Doctor Perview:
https://github.com/MohammedMoataz/MobiCare/assets/81831838/75271e59-3424-410a-a6a0-91c100ba98e5

#### Patient Perview:
https://github.com/MohammedMoataz/MobiCare/assets/81831838/16985996-7dbb-407d-b765-7e3b71ca74dd

![mobicare](https://github.com/MohammedMoataz/MobiCare/assets/81831838/a51d48f3-5457-4eeb-91c1-d0af2d5f4dc2)

#### MobiCare Collection APIs:
[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.postman.com/catch-code/workspace/mobicare) 
Note: Don't forget to run the server

## For more information about the system, implementation, and technologies:

 - [Check The Documentation](https://docs.google.com/document/d/1nsXOrfUfKaulsYXMVjJG-JX4o5VT4zXMmBrDNxSBChc/edit?usp=sharing)
 - [Check The Presentation](https://docs.google.com/presentation/d/1rFsaqCy1QIhrT6Yzgdk3_Cq70DdL3QZuRzHdD5ECEkc/edit?usp=sharing)
