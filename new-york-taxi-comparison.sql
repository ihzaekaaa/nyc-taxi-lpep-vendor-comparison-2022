-- Query ini digunakan untuk menganalisis perbandingan dua vendor LPEP taksi di NYC pada tahun 2022.
-- Menampilkan rata-rata tarif, jarak, dan total perjalanan bulanan dari masing-masing vendor.

SELECT (
  CASE
  WHEN vendor_id LIKE "1" THEN "Creative Mobile Technologies, LLC"
  ELSE "VeriFone Inc."
  END
) AS vendor,
  EXTRACT(MONTH FROM pickup_datetime) AS month,
  AVG(total_amount) AS average_fare,
  AVG(trip_distance) AS average_distance,
  COUNT(*) AS total_trips
FROM bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2022
GROUP BY vendor, month
HAVING month < 12
ORDER BY month, total_trips DESC, average_distance DESC, average_fare DESC

