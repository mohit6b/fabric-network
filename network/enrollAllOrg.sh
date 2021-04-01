echo "Enroll Orderer"

# preparation
mkdir -p /tmp/hyperledger/ayn/orderer/assets/ca 
cp /tmp/hyperledger/ayn/ca/admin/msp/cacerts/0-0-0-0-7053.pem /tmp/hyperledger/ayn/orderer/assets/ca/ayn-ca-cert.pem

mkdir -p /tmp/hyperledger/ayn/orderer/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/ayn/orderer/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/ayn/orderer
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/ayn/orderer/assets/ca/ayn-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://orderer1-ayn:ordererpw@0.0.0.0:7053
fabric-ca-client enroll -d -u https://orderer2-ayn:ordererpw@0.0.0.0:7053
fabric-ca-client enroll -d -u https://orderer3-ayn:ordererpw@0.0.0.0:7053
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/ayn/orderer/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://orderer1-ayn:ordererPW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer1-ayn --csr.hosts localhost
fabric-ca-client enroll -d -u https://orderer2-ayn:ordererPW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer2-ayn --csr.hosts localhost
fabric-ca-client enroll -d -u https://orderer3-ayn:ordererPW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts orderer3-ayn --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/ayn/orderer/tls-msp/keystore/*_sk /tmp/hyperledger/ayn/orderer/tls-msp/keystore/key.pem

echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/ayn/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/ayn/orderer/assets/ca/ayn-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-ayn:aynadminpw@0.0.0.0:7053

mkdir -p /tmp/hyperledger/ayn/orderer/msp/admincerts
cp /tmp/hyperledger/ayn/admin/msp/signcerts/cert.pem /tmp/hyperledger/ayn/orderer/msp/admincerts/orderer-admin-cert.pem

mkdir -p /tmp/hyperledger/ayn/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/ayn/orderer/assets/ca/ayn-ca-cert.pem /tmp/hyperledger/ayn/msp/cacerts/
cp /tmp/hyperledger/ayn/orderer/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/ayn/msp/tlscacerts/
cp /tmp/hyperledger/ayn/admin/msp/signcerts/cert.pem /tmp/hyperledger/ayn/msp/admincerts/admin-ayn-cert.pem
cp ./ayn-config.yaml /tmp/hyperledger/ayn/msp/config.yaml
echo "ayn done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/doctor/peer1/assets/ca 
cp /tmp/hyperledger/doctor/ca/admin/msp/cacerts/0-0-0-0-7054.pem /tmp/hyperledger/doctor/peer1/assets/ca/doctor-ca-cert.pem

mkdir -p /tmp/hyperledger/doctor/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/doctor/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/doctor/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/peer1/assets/ca/doctor-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-doctor:peer1PW@0.0.0.0:7054
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-doctor:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-doctor --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/doctor/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/doctor/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/doctor/peer2/assets/ca 
cp /tmp/hyperledger/doctor/ca/admin/msp/cacerts/0-0-0-0-7054.pem /tmp/hyperledger/doctor/peer2/assets/ca/doctor-ca-cert.pem

mkdir -p /tmp/hyperledger/doctor/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/doctor/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/doctor/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/peer2/assets/ca/doctor-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-doctor:peer2PW@0.0.0.0:7054
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-doctor:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-doctor --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/doctor/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/doctor/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/doctor/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/doctor/peer1/assets/ca/doctor-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-doctor:doctorAdminPW@0.0.0.0:7054

mkdir -p /tmp/hyperledger/doctor/peer1/msp/admincerts
cp /tmp/hyperledger/doctor/admin/msp/signcerts/cert.pem /tmp/hyperledger/doctor/peer1/msp/admincerts/doctor-admin-cert.pem

mkdir -p /tmp/hyperledger/doctor/peer2/msp/admincerts
cp /tmp/hyperledger/doctor/admin/msp/signcerts/cert.pem /tmp/hyperledger/doctor/peer2/msp/admincerts/doctor-admin-cert.pem

mkdir -p /tmp/hyperledger/doctor/admin/msp/admincerts
cp /tmp/hyperledger/doctor/admin/msp/signcerts/cert.pem /tmp/hyperledger/doctor/admin/msp/admincerts/doctor-admin-cert.pem

mkdir -p /tmp/hyperledger/doctor/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/doctor/peer1/assets/ca/doctor-ca-cert.pem /tmp/hyperledger/doctor/msp/cacerts/
cp /tmp/hyperledger/doctor/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/doctor/msp/tlscacerts/
cp /tmp/hyperledger/doctor/admin/msp/signcerts/cert.pem /tmp/hyperledger/doctor/msp/admincerts/admin-doctor-cert.pem
cp ./doctor-config.yaml /tmp/hyperledger/doctor/msp/config.yaml
echo "doctor done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/patient/peer1/assets/ca 
cp /tmp/hyperledger/patient/ca/admin/msp/cacerts/0-0-0-0-7055.pem /tmp/hyperledger/patient/peer1/assets/ca/patient-ca-cert.pem

mkdir -p /tmp/hyperledger/patient/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/patient/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/patient/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/peer1/assets/ca/patient-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-patient:peer1PW@0.0.0.0:7055
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-patient:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-patient --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/patient/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/patient/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/patient/peer2/assets/ca 
cp /tmp/hyperledger/patient/ca/admin/msp/cacerts/0-0-0-0-7055.pem /tmp/hyperledger/patient/peer2/assets/ca/patient-ca-cert.pem

mkdir -p /tmp/hyperledger/patient/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/patient/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/patient/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/peer2/assets/ca/patient-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-patient:peer2PW@0.0.0.0:7055
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-patient:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-patient --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/patient/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/patient/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/patient/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/patient/peer1/assets/ca/patient-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-patient:patientAdminPW@0.0.0.0:7055

mkdir -p /tmp/hyperledger/patient/peer1/msp/admincerts
cp /tmp/hyperledger/patient/admin/msp/signcerts/cert.pem /tmp/hyperledger/patient/peer1/msp/admincerts/patient-admin-cert.pem

mkdir -p /tmp/hyperledger/patient/peer2/msp/admincerts
cp /tmp/hyperledger/patient/admin/msp/signcerts/cert.pem /tmp/hyperledger/patient/peer2/msp/admincerts/patient-admin-cert.pem

mkdir -p /tmp/hyperledger/patient/admin/msp/admincerts
cp /tmp/hyperledger/patient/admin/msp/signcerts/cert.pem /tmp/hyperledger/patient/admin/msp/admincerts/patient-admin-cert.pem

mkdir -p /tmp/hyperledger/patient/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/patient/peer1/assets/ca/patient-ca-cert.pem /tmp/hyperledger/patient/msp/cacerts/
cp /tmp/hyperledger/patient/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/patient/msp/tlscacerts/
cp /tmp/hyperledger/patient/admin/msp/signcerts/cert.pem /tmp/hyperledger/patient/msp/admincerts/admin-patient-cert.pem
cp ./patient-config.yaml /tmp/hyperledger/patient/msp/config.yaml
echo "patient done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/insurer/peer1/assets/ca 
cp /tmp/hyperledger/insurer/ca/admin/msp/cacerts/0-0-0-0-7056.pem /tmp/hyperledger/insurer/peer1/assets/ca/insurer-ca-cert.pem

mkdir -p /tmp/hyperledger/insurer/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/insurer/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/insurer/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/peer1/assets/ca/insurer-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-insurer:peer1PW@0.0.0.0:7056
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-insurer:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-insurer --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/insurer/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/insurer/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/insurer/peer2/assets/ca 
cp /tmp/hyperledger/insurer/ca/admin/msp/cacerts/0-0-0-0-7056.pem /tmp/hyperledger/insurer/peer2/assets/ca/insurer-ca-cert.pem

mkdir -p /tmp/hyperledger/insurer/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/insurer/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/insurer/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/peer2/assets/ca/insurer-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-insurer:peer2PW@0.0.0.0:7056
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-insurer:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-insurer --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/insurer/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/insurer/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/insurer/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/insurer/peer1/assets/ca/insurer-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-insurer:insurerAdminPW@0.0.0.0:7056

mkdir -p /tmp/hyperledger/insurer/peer1/msp/admincerts
cp /tmp/hyperledger/insurer/admin/msp/signcerts/cert.pem /tmp/hyperledger/insurer/peer1/msp/admincerts/insurer-admin-cert.pem

mkdir -p /tmp/hyperledger/insurer/peer2/msp/admincerts
cp /tmp/hyperledger/insurer/admin/msp/signcerts/cert.pem /tmp/hyperledger/insurer/peer2/msp/admincerts/insurer-admin-cert.pem

mkdir -p /tmp/hyperledger/insurer/admin/msp/admincerts
cp /tmp/hyperledger/insurer/admin/msp/signcerts/cert.pem /tmp/hyperledger/insurer/admin/msp/admincerts/insurer-admin-cert.pem

mkdir -p /tmp/hyperledger/insurer/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/insurer/peer1/assets/ca/insurer-ca-cert.pem /tmp/hyperledger/insurer/msp/cacerts/
cp /tmp/hyperledger/insurer/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/insurer/msp/tlscacerts/
cp /tmp/hyperledger/insurer/admin/msp/signcerts/cert.pem /tmp/hyperledger/insurer/msp/admincerts/admin-insurer-cert.pem
cp ./insurer-config.yaml /tmp/hyperledger/insurer/msp/config.yaml
echo "insurer done"
sleep 5
echo 
echo "Enroll Peer1"

# preparation
mkdir -p /tmp/hyperledger/pharmacy/peer1/assets/ca 
cp /tmp/hyperledger/pharmacy/ca/admin/msp/cacerts/0-0-0-0-7057.pem /tmp/hyperledger/pharmacy/peer1/assets/ca/pharmacy-ca-cert.pem

mkdir -p /tmp/hyperledger/pharmacy/peer1/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/pharmacy/peer1/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/pharmacy/peer1
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/peer1/assets/ca/pharmacy-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer1-pharmacy:peer1PW@0.0.0.0:7057
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/peer1/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer1-pharmacy:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-pharmacy --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/pharmacy/peer1/tls-msp/keystore/*_sk /tmp/hyperledger/pharmacy/peer1/tls-msp/keystore/key.pem

echo "Enroll Peer2"

# preparation
mkdir -p /tmp/hyperledger/pharmacy/peer2/assets/ca 
cp /tmp/hyperledger/pharmacy/ca/admin/msp/cacerts/0-0-0-0-7057.pem /tmp/hyperledger/pharmacy/peer2/assets/ca/pharmacy-ca-cert.pem

mkdir -p /tmp/hyperledger/pharmacy/peer2/assets/tls-ca 
cp /tmp/hyperledger/tls-ca/admin/msp/cacerts/0-0-0-0-7052.pem /tmp/hyperledger/pharmacy/peer2/assets/tls-ca/tls-ca-cert.pem

# for identity
export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/pharmacy/peer2
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/peer2/assets/ca/pharmacy-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://peer2-pharmacy:peer2PW@0.0.0.0:7057
sleep 5

# for TLS
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/peer2/assets/tls-ca/tls-ca-cert.pem

fabric-ca-client enroll -d -u https://peer2-pharmacy:peer2PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer2-pharmacy --csr.hosts localhost
sleep 5

cp /tmp/hyperledger/pharmacy/peer2/tls-msp/keystore/*_sk /tmp/hyperledger/pharmacy/peer2/tls-msp/keystore/key.pem


echo "Enroll Admin"

export FABRIC_CA_CLIENT_HOME=/tmp/hyperledger/pharmacy/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/hyperledger/pharmacy/peer1/assets/ca/pharmacy-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-pharmacy:pharmacyAdminPW@0.0.0.0:7057

mkdir -p /tmp/hyperledger/pharmacy/peer1/msp/admincerts
cp /tmp/hyperledger/pharmacy/admin/msp/signcerts/cert.pem /tmp/hyperledger/pharmacy/peer1/msp/admincerts/pharmacy-admin-cert.pem

mkdir -p /tmp/hyperledger/pharmacy/peer2/msp/admincerts
cp /tmp/hyperledger/pharmacy/admin/msp/signcerts/cert.pem /tmp/hyperledger/pharmacy/peer2/msp/admincerts/pharmacy-admin-cert.pem

mkdir -p /tmp/hyperledger/pharmacy/admin/msp/admincerts
cp /tmp/hyperledger/pharmacy/admin/msp/signcerts/cert.pem /tmp/hyperledger/pharmacy/admin/msp/admincerts/pharmacy-admin-cert.pem

mkdir -p /tmp/hyperledger/pharmacy/msp/{admincerts,cacerts,tlscacerts,users}
cp /tmp/hyperledger/pharmacy/peer1/assets/ca/pharmacy-ca-cert.pem /tmp/hyperledger/pharmacy/msp/cacerts/
cp /tmp/hyperledger/pharmacy/peer1/assets/tls-ca/tls-ca-cert.pem /tmp/hyperledger/pharmacy/msp/tlscacerts/
cp /tmp/hyperledger/pharmacy/admin/msp/signcerts/cert.pem /tmp/hyperledger/pharmacy/msp/admincerts/admin-pharmacy-cert.pem
cp ./pharmacy-config.yaml /tmp/hyperledger/pharmacy/msp/config.yaml
echo "pharmacy done"
