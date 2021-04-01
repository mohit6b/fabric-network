# cedar_fabric_network

# Cedar Network Topology and Components with Fabric CA <br />

Organizations <br />
Provider - 1 CA, 2 Peers, (admin and users) <br />
Insurer - 1 CA, 2 Peers, (admin and users) <br />
Pharmacy - 1 CA, 2 Peers, (admin and users) <br />
Patient - 1 CA, 2 Peers, (admin and users) <br />
<br />
Assets: Required containers for below entities: <br />
CAs - OrdererCA, ProviderCA (DoctorCA), PatientCA, InsurerCA, PharmacyCA <br />
Organizations - Provider Org (Doctor Org), PatientOrg, InsurerOrg, PharmacyOrg <br />
Peers - peer1-Provider, peer2-Provider, peer1-Patient, peer2-Patient, peer1-Insurer, peer2-Insurer,  peer1-Pharmacy, peer2-Pharmacy <br />

Peers: <br />
peer1-Provider - n users <br />
peer2-Provider - n users <br />
peer1-Patient - n users <br />
peer2-Patient - n users <br />
peer1-Insurer - n users <br />
peer2-Insurer - n users <br />
peer1-Pharmacy - n users <br />
peer2-Pharmacy - n users <br />
<br />
Orderers: <br />
Doctor-Orderer <br />
Patient-Orderer <br />
Insurer-Orderer <br />
Pharmacy-Orderer <br />
<br />
CA <br />
Orderer CA <br />
Provider CA (Doctor CA) <br />
Patient CA <br />
Insurer CA <br />
Pharmacy CA <br />
TLS CA (Transport Layer Security for communication inside channel and more as required)<br />

SDK Server <br />

Configurations of Assets <br />

Fields of Assets : need to get from backend team

