import React from 'react';

const NoResultsCard = ({ title, message, buttonText, onClick }) => {
  return (
    <tr>
      <td colSpan="5">
        <div className="no-results-card">
          <h2>{title}</h2>
          <p>{message}</p>
          <button className="btn" onClick={onClick}>{buttonText}</button>
        </div>
      </td>
    </tr>
  );
};

export default NoResultsCard;
