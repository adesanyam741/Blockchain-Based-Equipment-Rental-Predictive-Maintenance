;; Sensor Data Contract
;; Collects and manages equipment sensor data

(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_EQUIPMENT_NOT_FOUND (err u201))
(define-constant ERR_INVALID_DATA (err u202))

;; Data structures
(define-map equipment-sensors
  { equipment-id: uint }
  {
    temperature: uint,
    vibration: uint,
    pressure: uint,
    runtime-hours: uint,
    last-updated: uint,
    owner: principal
  }
)

(define-map sensor-history
  { equipment-id: uint, timestamp: uint }
  {
    temperature: uint,
    vibration: uint,
    pressure: uint,
    runtime-hours: uint
  }
)

;; Public functions
(define-public (register-equipment (equipment-id uint))
  (begin
    (asserts! (is-none (map-get? equipment-sensors { equipment-id: equipment-id })) ERR_EQUIPMENT_NOT_FOUND)

    (map-set equipment-sensors
      { equipment-id: equipment-id }
      {
        temperature: u0,
        vibration: u0,
        pressure: u0,
        runtime-hours: u0,
        last-updated: block-height,
        owner: tx-sender
      }
    )
    (ok true)
  )
)

(define-public (update-sensor-data (equipment-id uint) (temperature uint) (vibration uint) (pressure uint) (runtime-hours uint))
  (let ((equipment (unwrap! (map-get? equipment-sensors { equipment-id: equipment-id }) ERR_EQUIPMENT_NOT_FOUND)))
    (asserts! (is-eq tx-sender (get owner equipment)) ERR_UNAUTHORIZED)
    (asserts! (and (< temperature u1000) (< vibration u1000) (< pressure u1000)) ERR_INVALID_DATA)

    ;; Store historical data
    (map-set sensor-history
      { equipment-id: equipment-id, timestamp: block-height }
      {
        temperature: temperature,
        vibration: vibration,
        pressure: pressure,
        runtime-hours: runtime-hours
      }
    )

    ;; Update current data
    (map-set equipment-sensors
      { equipment-id: equipment-id }
      (merge equipment {
        temperature: temperature,
        vibration: vibration,
        pressure: pressure,
        runtime-hours: runtime-hours,
        last-updated: block-height
      })
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-sensor-data (equipment-id uint))
  (map-get? equipment-sensors { equipment-id: equipment-id })
)

(define-read-only (get-historical-data (equipment-id uint) (timestamp uint))
  (map-get? sensor-history { equipment-id: equipment-id, timestamp: timestamp })
)
