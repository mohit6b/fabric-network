echo "Working on TLS-CA"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/tls-ca/crypto/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/tls-ca/admin

fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@0.0.0.0:7052
sleep 5

fabric-ca-client register -d --id.name peer1-doctor --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-doctor --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-patient --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-patient --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-insurer --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-insurer --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer1-pharmacy --id.secret peer1PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name peer2-pharmacy --id.secret peer2PW --id.type peer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer1-ayn --id.secret orderer1PW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer2-ayn --id.secret orderer2PW --id.type orderer -u https://0.0.0.0:7052
fabric-ca-client register -d --id.name orderer3-ayn --id.secret orderer3PW --id.type orderer -u https://0.0.0.0:7052

echo "Working on RCA-ayn"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/ayn/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/ayn/ca/admin

fabric-ca-client enroll -d -u https://rca-ayn-admin:rca-ayn-adminpw@0.0.0.0:7053
sleep 5

fabric-ca-client register -d --id.name orderer1-ayn --id.secret orderer1pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer2-ayn --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name orderer3-ayn --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:7053
fabric-ca-client register -d --id.name admin-ayn --id.secret aynadminpw --id.type admin --id.attrs "hf.Registrar.Roles=client,hf.Registrar.Attributes=*,hf.Revoker=true,hf.GenCRL=true,admin=true:ecert,abac.init=true:ecert" -u https://0.0.0.0:7053

echo "Working on RCA-Provider(Doctor)"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/doctor/ca/admin

fabric-ca-client enroll -d -u https://rca-doctor-admin:rca-doctor-adminpw@0.0.0.0:7054
sleep 5

fabric-ca-client register -d --id.name peer1-doctor --id.secret peer1PW --id.type peer -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name peer2-doctor --id.secret peer2PW --id.type peer -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name admin-doctor --id.secret doctorAdminPW --id.type admin -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name user-doctor --id.secret doctorUserPW --id.type user -u https://0.0.0.0:7054

echo "Working on RCA-Patient"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/patient/ca/admin

fabric-ca-client enroll -d -u https://rca-patient-admin:rca-patient-adminpw@0.0.0.0:7055
sleep 5

fabric-ca-client register -d --id.name peer1-patient --id.secret peer1PW --id.type peer -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name peer2-patient --id.secret peer2PW --id.type peer -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name admin-patient --id.secret patientAdminPW --id.type admin --id.attrs "abac.init=true:ecert" -u https://0.0.0.0:7055
fabric-ca-client register -d --id.name user-patient --id.secret patientUserPW --id.type user -u https://0.0.0.0:7055

echo "Working on RCA-Insurer"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/insurer/ca/admin

fabric-ca-client enroll -d -u https://rca-insurer-admin:rca-insurer-adminpw@0.0.0.0:7056
sleep 5

fabric-ca-client register -d --id.name peer1-insurer --id.secret peer1PW --id.type peer -u https://0.0.0.0:7056
fabric-ca-client register -d --id.name peer2-insurer --id.secret peer2PW --id.type peer -u https://0.0.0.0:7056
fabric-ca-client register -d --id.name admin-insurer --id.secret insurerAdminPW --id.type admin -u https://0.0.0.0:7056
fabric-ca-client register -d --id.name user-insurer --id.secret insurerUserPW --id.type user -u https://0.0.0.0:7056

echo "Working on RCA-Pharmacy"

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/ca/crypto/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/pharmacy/ca/admin

fabric-ca-client enroll -d -u https://rca-pharmacy-admin:rca-pharmacy-adminpw@0.0.0.0:7057
sleep 5

fabric-ca-client register -d --id.name peer1-pharmacy --id.secret peer1PW --id.type peer -u https://0.0.0.0:7057
fabric-ca-client register -d --id.name peer2-pharmacy --id.secret peer2PW --id.type peer -u https://0.0.0.0:7057
fabric-ca-client register -d --id.name admin-pharmacy --id.secret pharmacyAdminPW --id.type admin -u https://0.0.0.0:7057
fabric-ca-client register -d --id.name user-pharmacy --id.secret pharmacyUserPW --id.type user -u https://0.0.0.0:7057

echo "All CA and registration done"

