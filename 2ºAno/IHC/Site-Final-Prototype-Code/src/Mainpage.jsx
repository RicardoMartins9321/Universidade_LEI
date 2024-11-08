import React, { useState, useEffect } from 'react';
import TheNavBar from './TheNavBar';
import Footer from './Footer';
import CarouselComponent from './CarouselComponent';
import './CommonStyles.css';
import Person1 from './imagens/person1.jpg';
import Person2 from './imagens/person2.jpg';
import Person3 from './imagens/person3.jpg';

function Testimonial({ image, name, description, quote }) {
  return (
    <div className="testimonial flex flex-col gap-5 p-16 bg-white rounded-lg border border-solid shadow-lg border-neutral-100">
      <blockquote className="text-xl text-black">{quote}</blockquote>
      <div className="flex gap-4 mt-12 text-base">
        <img src={image} alt={`${name}'s avatar`} className="testimonial-avatar shrink-0 my-auto rounded-full h-12 w-12 object-cover" />
        <div className="flex flex-col gap-0.5">
          <cite className="text-black">{name}</cite>
          <div className="text-zinc-500">{description}</div>
        </div>
      </div>
    </div>
  );
}

function UpcomingEvents() {
  return (
    <div className="upcoming-events bg-white p-4 mt-4 rounded-lg shadow-lg">
      <h3 className="text-lg font-semibold">Próximos Eventos</h3>
      <ul>
        <a href="http://localhost:3000/competion/1"><li>Campeonato Nacional - Castelo Branco - 13/05/2024</li></a>
        <a href="http://localhost:3000/competion/1"><li>Campeonato Nacional - Faro - 14/05/2024</li></a>
        <a href="http://localhost:3000/competion/1"><li>Campeonato Nacional - Braga - 27/03/2024</li></a>
      </ul>
    </div>
  );
}

function MainPage() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const userData = sessionStorage.getItem("Login");
    setIsLoggedIn(!!userData);
  }, []);

  const testimonials = [
    { image: Person1, name: "Pedro F.", description: "3/5/2024", quote: "Parabéns campeão!" },
    { image: Person2, name: "Ricardo M.", description: "7/5/2024", quote: "😀🇵🇹" },
    { image: Person3, name: "João P.", description: "5/5/2024", quote: "Orgulho" },
  ];

  return (
    <>
      <TheNavBar />
      <main className="main-content">
        <div className="container mx-auto px-4">
          <div className="content-bg bg-white rounded-xl shadow-lg p-8">
            <CarouselComponent isLoggedIn={isLoggedIn} />
            <h2 className="main-heading text-center">Notícias da Semana!</h2>
            <div className="testimonial-container grid grid-cols-1 md:grid-cols-3 gap-4">
              {testimonials.map((testimonial, index) => (
                <Testimonial key={index} {...testimonial} />
              ))}
            </div>
            <UpcomingEvents />
          </div>
        </div>
      </main>
      <Footer />
    </>
  );
}

export default MainPage;
