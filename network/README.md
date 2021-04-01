Cedar Network Topology and Components with Fabric CA 

Organizations 
Provider - 1 CA, 2 Peers, (admin and users)
Insurer - 1 CA, 2 Peers, (admin and users)
Pharmacy - 1 CA, 2 Peers, (admin and users)
Patient - 1 CA, 2 Peers, (admin and users)

Assets: Required containers for below entities:
CAs - OrdererCA, ProviderCA (DoctorCA), PatientCA, InsurerCA, PharmacyCA
Organizations - Provider Org (Doctor Org), PatientOrg, InsurerOrg, PharmacyOrg
Peers - peer1-Provider, peer2-Provider, peer1-Patient, peer2-Patient, peer1-Insurer, peer2-Insurer, peer1-Pharmacy, peer2-Pharmacy

Peers:
peer1-Provider - n users
peer2-Provider - n users
peer1-Patient - n users
peer2-Patient - n users
peer1-Insurer - n users
peer2-Insurer - n users
peer1-Pharmacy - n users
peer2-Pharmacy - n users

Orderers:
Doctor-Orderer 
Patient-Orderer
Insurer-Orderer
Pharmacy-Orderer

CA
Orderer CA
Provider CA (Doctor CA)
Patient CA
Insurer CA
Pharmacy CA
TLS CA (Transport Layer Security for communication inside channel and more as required)

SDK Server

Configurations of Assets

Fields of Assets : need to get from backend team

