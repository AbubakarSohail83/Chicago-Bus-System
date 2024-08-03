const Ridership = ({ longest_route }) => {
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "100vh",
        backgroundColor: "#f5f5f5",
      }}
    >
      <table
        style={{
          borderCollapse: "collapse",
          width: "60%",
          backgroundColor: "#fff",
          boxShadow: "0 2px 4px rgba(0,0,0,0.1)",
        }}
      >
        <thead>
          <tr>
            <th
              style={{
                border: "2px solid #ddd",
                padding: "8px",
                textAlign: "center",
              }}
            >
              Route ID
            </th>
            <th
              style={{
                border: "2px solid #ddd",
                padding: "8px",
                textAlign: "center",
              }}
            >
              Number of Bus Stops
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td
              style={{
                border: "2px solid #ddd",
                padding: "8px",
                textAlign: "center",
              }}
            >
              {longest_route[0]}
            </td>
            <td
              style={{
                border: "2px solid #ddd",
                padding: "8px",
                textAlign: "center",
              }}
            >
              {longest_route[1]}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  );
};
