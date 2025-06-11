# Blockchain-Based Equipment Rental Predictive Maintenance

A comprehensive blockchain solution for equipment rental companies to implement predictive maintenance using smart contracts on the Stacks blockchain.

## Overview

This system leverages blockchain technology to create a transparent, immutable, and automated predictive maintenance solution for equipment rental operations. The platform consists of five interconnected smart contracts that work together to optimize maintenance operations and reduce costs.

## Features

### 🏭 Manufacturer Verification
- Validate and manage equipment manufacturers
- Track manufacturer credentials and verification status
- Maintain equipment count per manufacturer

### 📊 Sensor Data Management
- Collect real-time equipment sensor data
- Store historical sensor readings
- Track temperature, vibration, pressure, and runtime hours

### 🔮 Predictive Analytics
- AI-powered maintenance prediction algorithms
- Risk assessment and failure prediction
- Automated alert generation for high-risk equipment

### 📅 Smart Scheduling
- Optimize maintenance scheduling based on predictions
- Manage technician availability and capacity
- Priority-based scheduling system

### 💰 Cost Optimization
- Track maintenance costs and savings
- Benchmark against industry standards
- Calculate ROI from predictive maintenance

## Smart Contracts

### 1. Manufacturer Verification Contract
\`\`\`clarity
;; Manages equipment manufacturer registration and verification
(define-public (register-manufacturer (name (string-ascii 50))))
(define-public (verify-manufacturer (manufacturer-id uint)))
\`\`\`

### 2. Sensor Data Contract
\`\`\`clarity
;; Collects and stores equipment sensor data
(define-public (register-equipment (equipment-id uint)))
(define-public (update-sensor-data (equipment-id uint) (temperature uint) (vibration uint) (pressure uint) (runtime-hours uint)))
\`\`\`

### 3. Maintenance Prediction Contract
\`\`\`clarity
;; Analyzes sensor data and predicts maintenance needs
(define-public (analyze-equipment (equipment-id uint) (temperature uint) (vibration uint) (pressure uint) (runtime-hours uint)))
(define-public (create-maintenance-alert (equipment-id uint) (alert-type (string-ascii 30)) (severity uint)))
\`\`\`

### 4. Scheduling Optimization Contract
\`\`\`clarity
;; Optimizes maintenance scheduling
(define-public (schedule-maintenance (equipment-id uint) (maintenance-type (string-ascii 20)) (priority uint) (duration uint)))
(define-public (set-technician-availability (technician principal) (date uint) (available bool) (capacity uint)))
\`\`\`

### 5. Cost Reduction Contract
\`\`\`clarity
;; Tracks costs and calculates savings
(define-public (record-maintenance-cost (equipment-id uint) (maintenance-id uint) (labor uint) (parts uint) (downtime uint) (category (string-ascii 20))))
(define-public (calculate-cost-savings (equipment-id uint)))
\`\`\`

## Installation

### Prerequisites
- Node.js (v16 or higher)
- Clarinet CLI
- Stacks Wallet

### Setup
1. Clone the repository:
   \`\`\`bash
   git clone https://github.com/your-org/blockchain-equipment-maintenance.git
   cd blockchain-equipment-maintenance
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Initialize Clarinet project:
   \`\`\`bash
   clarinet new equipment-maintenance
   cd equipment-maintenance
   \`\`\`

4. Deploy contracts:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

## Usage

### 1. Register Equipment Manufacturer
\`\`\`javascript
// Register a new manufacturer
const result = await contractCall({
contractAddress: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM',
contractName: 'manufacturer-verification',
functionName: 'register-manufacturer',
functionArgs: [stringAsciiCV('Caterpillar Inc')]
});
\`\`\`

### 2. Register Equipment and Update Sensor Data
\`\`\`javascript
// Register equipment
await contractCall({
contractName: 'sensor-data',
functionName: 'register-equipment',
functionArgs: [uintCV(1)]
});

// Update sensor readings
await contractCall({
contractName: 'sensor-data',
functionName: 'update-sensor-data',
functionArgs: [uintCV(1), uintCV(750), uintCV(600), uintCV(800), uintCV(4500)]
});
\`\`\`

### 3. Analyze Equipment and Get Predictions
\`\`\`javascript
// Analyze equipment condition
await contractCall({
contractName: 'maintenance-prediction',
functionName: 'analyze-equipment',
functionArgs: [uintCV(1), uintCV(750), uintCV(600), uintCV(800), uintCV(4500)]
});

// Get maintenance prediction
const prediction = await contractCall({
contractName: 'maintenance-prediction',
functionName: 'get-prediction',
functionArgs: [uintCV(1)]
});
\`\`\`

### 4. Schedule Maintenance
\`\`\`javascript
// Schedule maintenance based on prediction
await contractCall({
contractName: 'scheduling-optimization',
functionName: 'schedule-maintenance',
functionArgs: [
uintCV(1),
stringAsciiCV('COOLING_SYSTEM'),
uintCV(4),
uintCV(4)
]
});
\`\`\`

### 5. Track Costs and Savings
\`\`\`javascript
// Record maintenance costs
await contractCall({
contractName: 'cost-reduction',
functionName: 'record-maintenance-cost',
functionArgs: [
uintCV(1),
uintCV(1),
uintCV(800),
uintCV(600),
uintCV(400),
stringAsciiCV('COOLING_SYSTEM')
]
});

// Calculate savings
const savings = await contractCall({
contractName: 'cost-reduction',
functionName: 'calculate-cost-savings',
functionArgs: [uintCV(1)]
});
\`\`\`

## Testing

Run the test suite:
\`\`\`bash
npm test
\`\`\`

Run specific test files:
\`\`\`bash
npm test manufacturer-verification.test.js
npm test sensor-data.test.js
npm test maintenance-prediction.test.js
npm test scheduling-optimization.test.js
npm test cost-reduction.test.js
\`\`\`

## Architecture

### Data Flow
1. **Equipment Registration**: Manufacturers register equipment in the system
2. **Sensor Data Collection**: IoT sensors continuously feed data to the blockchain
3. **Predictive Analysis**: AI algorithms analyze sensor data to predict failures
4. **Maintenance Scheduling**: System optimally schedules maintenance based on predictions
5. **Cost Tracking**: All maintenance activities and costs are recorded and analyzed

### Security Features
- **Immutable Records**: All maintenance data is permanently stored on blockchain
- **Access Control**: Role-based permissions for different user types
- **Data Integrity**: Cryptographic verification of all sensor data
- **Audit Trail**: Complete history of all maintenance activities

## Benefits

### For Equipment Rental Companies
- **Reduced Downtime**: Predict failures before they occur
- **Cost Savings**: Optimize maintenance schedules and reduce emergency repairs
- **Improved Efficiency**: Automated scheduling and resource allocation
- **Better Customer Service**: Minimize equipment failures during rentals

### For Customers
- **Reliable Equipment**: Well-maintained equipment with minimal breakdowns
- **Transparent Maintenance**: Blockchain-verified maintenance records
- **Competitive Pricing**: Cost savings passed on to customers

## Roadmap

### Phase 1 (Current)
- ✅ Core smart contracts implementation
- ✅ Basic predictive algorithms
- ✅ Test suite development

### Phase 2 (Q2 2024)
- 🔄 Advanced ML prediction models
- 🔄 Mobile app for technicians
- 🔄 Integration with popular IoT sensors

### Phase 3 (Q3 2024)
- 📋 Multi-chain support
- 📋 Advanced analytics dashboard
- 📋 API for third-party integrations

### Phase 4 (Q4 2024)
- 📋 AI-powered parts ordering
- 📋 Predictive supply chain management
- 📋 Carbon footprint tracking

## Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support and questions:
- 📧 Email: support@blockchain-equipment-maintenance.com
- 💬 Discord: [Join our community](https://discord.gg/blockchain-maintenance)
- 📖 Documentation: [docs.blockchain-equipment-maintenance.com](https://docs.blockchain-equipment-maintenance.com)

## Acknowledgments

- Stacks Foundation for blockchain infrastructure
- Equipment rental industry partners for requirements and testing
- Open source community for tools and libraries

---

**Built with ❤️ for the equipment rental industry**
