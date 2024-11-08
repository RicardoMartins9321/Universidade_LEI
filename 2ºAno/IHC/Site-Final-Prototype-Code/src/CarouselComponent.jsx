import React, { useState, useEffect } from 'react';
import Carousel from 'react-bootstrap/Carousel';
import Noticia1 from './imagens/noticia1.jpg';
import Noticia2 from './imagens/noticia2.jpg';
import Noticia3 from './imagens/noticia3.jpg';
import aveiro1 from './imagens/aveiro1.jpg';
import aveiro2 from './imagens/aveiro2.jpg';
import aveiro3 from './imagens/aveiro3.jpg';

const CarouselComponent = ({ isLoggedIn }) => {
  const [slides, setSlides] = useState([]);

  useEffect(() => {
    if (isLoggedIn) {
      setSlides([
        { id: 1, imageUrl: aveiro1, altText: 'Notícia Especial 3', subtitle: 'Evento especial apenas para membros!' },
        { id: 2, imageUrl: aveiro2, altText: 'Notícia Especial 2', subtitle: 'Laura Bento conquista título sub-14!' },
        { id: 3, imageUrl: aveiro3, altText: 'Notícia Especial 1', subtitle: 'João Almeida vence a meia maratona de Aveiro!' },
      ]);
    } else {
      setSlides([
        { id: 1, imageUrl: Noticia1, altText: 'Notícia 1', subtitle: 'Portugal vence prova no Japão!' },
        { id: 2, imageUrl: Noticia2, altText: 'Notícia 2', subtitle: 'Andre Almeida termina no pódio!' },
        { id: 3, imageUrl: Noticia3, altText: 'Notícia 3', subtitle: 'Leira vence em Pombal!' },
      ]);
    }
  }, [isLoggedIn]);

  return (
    <Carousel>
      {slides.map((slide) => (
        <Carousel.Item key={slide.id}>
          <img
            className="d-block w-100"
            src={slide.imageUrl}
            alt={slide.altText}
            style={{ objectFit: 'fill', maxHeight: '500px' }} // Ajuste para conter a imagem sem cortar
          />
          <Carousel.Caption>
            <h3>{slide.subtitle}</h3>
          </Carousel.Caption>
        </Carousel.Item>
      ))}
    </Carousel>
  );
};

export default CarouselComponent;
