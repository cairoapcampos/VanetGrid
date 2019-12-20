#include <cstdlib>
#include <ctime>
#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <sstream>

#define PARKING_AREAS 30 // Qtd de areas de estacionamento
#define PL_PER_AREA 4 // Qtd de estacionamnetos por area
#define VEHICLES_PER_PL 4 // Qtd veiculos por estacionamento

using namespace std;

map<int, string> lanes;

void startupLanes() {
	
	lanes[0] = "B2A2";
	lanes[1] = "C2B2";
	lanes[2] = "D2C2";
	lanes[3] = "A2B2";
	lanes[4] = "B2C2";
	lanes[5] = "C2D2";

	lanes[6] = "B1A1";
	lanes[7] = "C1B1";
	lanes[8] = "D1C1";
	lanes[9] = "A1B1";
	lanes[10] = "B1C1";
	lanes[11] = "C1D1";

	lanes[12] = "B1B0";
	lanes[13] = "B2B1";
	lanes[14] = "B3B2";

	lanes[15] = "C0C1";
	lanes[16] = "C1C2";
	lanes[17] = "C2C3";

	lanes[18] = "B0A0";
	lanes[19] = "C0B0";
	lanes[20] = "D0C0";

	lanes[21] = "A3B3";
	lanes[22] = "B3C3";
	lanes[23] = "C3D3";
	
	lanes[24] = "D3D2";
	lanes[25] = "D2D1";
	lanes[26] = "D1D0";
	
	lanes[27] = "A2A3";
	lanes[28] = "A1A2";
	lanes[29] = "A0A1";
}

string getLaneId(int parkingSlot) {
	return lanes[parkingSlot / (PL_PER_AREA * VEHICLES_PER_PL)];
}

int getParkingLotId(int parkingSlot) {
	return ((parkingSlot % (PL_PER_AREA * VEHICLES_PER_PL)) / VEHICLES_PER_PL) + 1;
}

string getParkingAreaCode(int parkingSlot) {
	stringstream ss;
	ss << "pa_" << getLaneId(parkingSlot) << "." << getParkingLotId(parkingSlot);
	return ss.str();
}

void writeSectionHeader(ofstream& output, string laneId) {
	output << endl << endl;
	output << "    <!-- Via " << laneId << " -->" << endl;
}

void writeVehicleSection(ofstream& output, int vId, string areaCode, string lane) {
	output << endl;
	//output << "    <vehicle id=\"" << vId << "\" depart=\"" << vId << ".00\">" << endl; // Usar só para departs incrementais
	output << "    <vehicle id=\"" << vId << "\" depart=\"0.00\">" << endl;
    output << "        <route edges=\"" << lane << "\"/>" << endl;
    output << "        <stop parkingArea=\"" << areaCode << "\" duration=\"3000.00\"/>" << endl;
    output << "    </vehicle>";
}

void writeOutput(int* parkingSlots, int size) {
	ofstream output("Report16Car.xml");
	int shift = PL_PER_AREA * VEHICLES_PER_PL;
	for (int i = 0; i < size; i++) {
		if (i % shift == 0) {
			writeSectionHeader(output, getLaneId(i));
		}
		writeVehicleSection(output, i, getParkingAreaCode(parkingSlots[i]), getLaneId(parkingSlots[i]));
	}
}

void swap(int& pos1, int& pos2) {
	int aux = pos1;
	pos1 = pos2;
	pos2 = aux;
}

int main() {
	startupLanes();
	int size = PARKING_AREAS * PL_PER_AREA * VEHICLES_PER_PL;
	int vehiclesPerLane = PL_PER_AREA * VEHICLES_PER_PL;
	int* parkingSlots = new int[size];
	for (int i = 0; i < size; i++) {
		parkingSlots[i] = i;
	}
	srand(time(NULL));
	for (int i = 0; i < size; i++) {
		int shiftId = i / vehiclesPerLane;
		int randomPos = rand() % vehiclesPerLane + (shiftId * vehiclesPerLane);
		swap(parkingSlots[i], parkingSlots[randomPos]);
	}
	writeOutput(parkingSlots, size);
}
