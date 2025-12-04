import { pageTitle } from 'ember-page-title';
import TeamMemberCard from '../components/team-member-card';

/**
 * Template de la página "Conócenos" - Lujan Motors
 * Historia de la empresa y presentación del equipo
 */
<template>
  {{pageTitle "Conócenos - Lujan Motors"}}

  <div class="page-enter">
    {{! Hero Section }}
    <section class="about-hero">
      <h1 class="about-hero__title">Conócenos</h1>
      <p class="about-hero__subtitle">
        Más de 20 años ofreciendo excelencia en el sector automotriz
      </p>
    </section>

    {{! History Section }}
    <section class="section section--light">
      <div class="container">
        <div class="history-section">
          <div class="history-content animate-slide-in-left">
            <h3>Nuestra Historia</h3>
            <p>
              Lujan Motors nació en 2004 con una visión clara: ofrecer una experiencia
              automotriz excepcional que combinara la pasión por los vehículos con un
              servicio al cliente impecable.
            </p>
            <p>
              Lo que comenzó como un pequeño taller familiar se ha convertido en uno de
              los concesionarios más respetados de la región, manteniendo siempre los
              valores que nos definen: honestidad, calidad y compromiso.
            </p>
            <p>
              Hoy, con más de 5.000 clientes satisfechos, seguimos creciendo pero sin
              perder nuestra esencia: tratar a cada cliente como parte de nuestra familia.
            </p>

            <div class="values-grid">
              <div class="value-item">
                <div class="value-icon">💎</div>
                <div class="value-text">
                  <h4>Excelencia</h4>
                  <p>Buscamos la perfección en cada detalle</p>
                </div>
              </div>
              <div class="value-item">
                <div class="value-icon">🤝</div>
                <div class="value-text">
                  <h4>Confianza</h4>
                  <p>Relaciones basadas en la transparencia</p>
                </div>
              </div>
              <div class="value-item">
                <div class="value-icon">🔧</div>
                <div class="value-text">
                  <h4>Profesionalidad</h4>
                  <p>Equipo altamente cualificado</p>
                </div>
              </div>
              <div class="value-item">
                <div class="value-icon">❤️</div>
                <div class="value-text">
                  <h4>Pasión</h4>
                  <p>Amamos lo que hacemos</p>
                </div>
              </div>
            </div>
          </div>
          <div class="history-image animate-slide-in-right">
            🏢
          </div>
        </div>
      </div>
    </section>

    {{! Team Section }}
    <section class="section section--cream">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">Nuestro Equipo</h2>
          <p class="section__subtitle">
            Conoce a las personas que hacen posible la magia de Lujan Motors
          </p>
        </div>

        <div class="team-grid">
          {{#each @model.teamMembers as |member index|}}
            <TeamMemberCard @member={{member}} />
          {{/each}}
        </div>
      </div>
    </section>

    {{! Mission Section }}
    <section class="section section--dark">
      <div class="container">
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-card__number">🎯</div>
            <div class="stat-card__label">Misión: Superar expectativas</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__number">👁️</div>
            <div class="stat-card__label">Visión: Referente del sector</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__number">⭐</div>
            <div class="stat-card__label">Valores: Integridad y pasión</div>
          </div>
        </div>
      </div>
    </section>

    {{! Why Choose Us }}
    <section class="section section--light">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">¿Por Qué Elegirnos?</h2>
          <p class="section__subtitle">
            Razones por las que miles de clientes confían en nosotros
          </p>
        </div>

        <div class="features-grid">
          <article class="feature-card">
            <div class="feature-card__icon">✅</div>
            <h3 class="feature-card__title">Garantía Total</h3>
            <p class="feature-card__description">
              Todos nuestros vehículos incluyen garantía extendida y servicio post-venta
              para tu tranquilidad.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">🏆</div>
            <h3 class="feature-card__title">Calidad Certificada</h3>
            <p class="feature-card__description">
              Certificaciones ISO y reconocimientos del sector avalan nuestra
              calidad y profesionalismo.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">💬</div>
            <h3 class="feature-card__title">Atención Personalizada</h3>
            <p class="feature-card__description">
              Cada cliente es único. Nos tomamos el tiempo de entender tus necesidades
              y encontrar la solución perfecta.
            </p>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>
