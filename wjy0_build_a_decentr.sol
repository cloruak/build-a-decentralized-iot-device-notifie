pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/SafeERC721.sol";

contract IoTNotifier {
    // Mapping of IoT devices to their owners
    mapping (address => mapping (string => bool)) public deviceOwners;

    // Mapping of IoT devices to their notification status
    mapping (string => bool) public deviceNotifications;

    // Event emitted when a new IoT device is registered
    event NewDevice(string deviceId, address owner);

    // Event emitted when a notification is sent for an IoT device
    event DeviceNotification(string deviceId, bool status);

    // Function to register a new IoT device
    function registerDevice(string memory deviceId, address owner) public {
        require(deviceOwners[owner][deviceId] == false, "Device already registered");
        deviceOwners[owner][deviceId] = true;
        emit NewDevice(deviceId, owner);
    }

    // Function to send a notification for an IoT device
    function sendNotification(string memory deviceId, bool status) public {
        require(deviceNotifications[deviceId] != status, "Notification status already updated");
        deviceNotifications[deviceId] = status;
        emit DeviceNotification(deviceId, status);
    }

    // Function to get the notification status of an IoT device
    function getNotificationStatus(string memory deviceId) public view returns (bool) {
        return deviceNotifications[deviceId];
    }
}