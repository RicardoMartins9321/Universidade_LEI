import React from 'react';
import { shuffle } from 'lodash';
import { Line } from 'react-chartjs-2';
import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

const colors = [
    'rgba(255, 99, 132, 1)',   // Red
    'rgba(54, 162, 235, 1)',   // Blue
    'rgba(255, 206, 86, 1)',   // Yellow
    'rgba(75, 192, 192, 1)',   // Green
    'rgba(153, 102, 255, 1)',  // Purple
    'rgba(255, 159, 64, 1)',   // Orange
    'rgba(231, 76, 60, 1)',    // Red
    'rgba(46, 204, 113, 1)',   // Emerald
    'rgba(52, 152, 219, 1)',   // Peter River
    'rgba(155, 89, 182, 1)',   // Amethyst
    'rgba(241, 196, 15, 1)',   // Sun Flower
    'rgba(230, 126, 34, 1)',   // Carrot
    'rgba(231, 76, 60, 1)',    // Alizarin
    'rgba(236, 240, 241, 1)',  // Clouds
    'rgba(149, 165, 166, 1)',  // Concrete
    'rgba(243, 156, 18, 1)',   // Orange
    'rgba(211, 84, 0, 1)',     // Pumpkin
    'rgba(192, 57, 43, 1)',    // Pomegranate
    'rgba(189, 195, 199, 1)',  // Silver
    'rgba(127, 140, 141, 1)',  // Asbestos
    'rgba(22, 160, 133, 1)',   // Green Sea
    'rgba(39, 174, 96, 1)',    // Nephritis
    'rgba(255, 0, 0, 1)',      // Red (Primary)
    'rgba(0, 255, 0, 1)',      // Green (Primary)
    'rgba(0, 0, 255, 1)',      // Blue (Primary)
    'rgba(255, 255, 0, 1)',    // Yellow (Primary)
    'rgba(255, 0, 255, 1)',    // Magenta (Primary)
    'rgba(0, 255, 255, 1)',    // Cyan (Primary)
    'rgba(128, 0, 0, 1)',      // Maroon
    'rgba(0, 128, 0, 1)',      // Olive
    'rgba(0, 0, 128, 1)',      // Navy
    'rgba(128, 128, 0, 1)',    // Olive Green
    'rgba(128, 0, 128, 1)',    // Purple
    'rgba(0, 128, 128, 1)',    // Teal
    'rgba(255, 165, 0, 1)',    // Orange (Web)
    'rgba(210, 105, 30, 1)',   // Chocolate
    'rgba(128, 128, 128, 1)',  // Gray
];

const GraphProgression = () => {
    // Shuffle the colors to randomize the order
    const shuffledColors = shuffle([...colors]);

    // Data for the chart
    const data = {
        labels: ['2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024'],
        datasets: [
            {
                label: '60 Metros',
                data: [undefined, 7.21, undefined, 6.86, undefined, undefined, undefined, undefined],
                borderColor: shuffledColors[0],
                borderWidth: 1,
                fill: false,
                spanGaps: true, // Connect lines with gaps in data by using the undefined value
            },
            {
                label: '100 Metros',
                data: [11.09, undefined, 10.99, 11.09, undefined, undefined, undefined, undefined],
                borderColor: shuffledColors[1],
                borderWidth: 1,
                fill: false,
                spanGaps: true,
            },
            {
                label: '150 Metros',
                data: [undefined, undefined, undefined, 15.78, undefined, undefined, undefined, undefined],
                borderColor: shuffledColors[2],
                borderWidth: 1,
                fill: false,
                spanGaps: true,
            },
            {
                label: '200 Metros',
                data: [23.09, undefined, 22.29, 21.49, undefined, 21.01, undefined, undefined],
                borderColor: shuffledColors[3],
                borderWidth: 1,
                fill: false,
                spanGaps: true,
            },
            {
                label: '300 Metros',
                data: [35.39, 33.70, undefined, 33.55, undefined, undefined, undefined, undefined],
                borderColor: shuffledColors[4],
                borderWidth: 1,
                fill: false,
                spanGaps: true,
            },
            {
                label: '400 Metros',
                data: [51.30, 47.37, 47.48, 46.81, 46.69, 45.41, 44.91, 44.79],
                borderColor: shuffledColors[5],
                borderWidth: 1,
                fill: false,
                spanGaps: true,
            },
        ],
    };

    // Options for the chart
    const options = {
        responsive: true, // Make the chart responsive
        maintainAspectRatio: false, // Allows graph to grow dynamically
        elements: {
            point: {
                radius: 5, // Increase point radius
                hoverRadius: 10, // Increase hover radius
            },
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: { font: { size: 14 }, color: '#000' } // Adjust label font size and color
            },
            x: {
                ticks: { font: { size: 14 }, color: '#000' } // Adjust label font size and color
            }
        },
        plugins: {
            legend: { labels: { font: { size: 14 }, color: '#000' } } // Adjust legend font size and color
        }
    };

    return (
        <div className="chart-container">
        <Line data={data} options={options} />
        <style jsx>{`
            .chart-container {
                width: 100%;
                min-height: 400px; /* Ensures the chart is visible */
                max-width: 1000px; /* Limits the maximum width */
                margin: 30px auto 40px; /* Adds margin for top and bottom, auto centers horizontally */
                padding: 0 20px; /* Adds padding for left and right */
                box-sizing: border-box; /* Includes padding and border in the element's total width and height */
            }
        `}</style>
    </div>
    );
};

export default GraphProgression;
