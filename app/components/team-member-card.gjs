import Component from '@glimmer/component';

/**
 * Componente de tarjeta de miembro del equipo
 * Muestra la información de un miembro del equipo de Lujan Motors
 */
export default class TeamMemberCard extends Component {
  <template>
    <article class="team-card">
      <div class="team-card__avatar">
        {{@member.avatar}}
      </div>
      <div class="team-card__content">
        <h3 class="team-card__name">{{@member.name}}</h3>
        <p class="team-card__role">{{@member.role}}</p>
        <p class="team-card__bio">{{@member.bio}}</p>
        <div class="team-card__social">
          <a href="mailto:{{@member.email}}" class="team-card__link" title="Email">
            ✉️
          </a>
          <a href={{@member.linkedin}} class="team-card__link" title="LinkedIn">
            💼
          </a>
          <a href={{@member.twitter}} class="team-card__link" title="Twitter">
            🐦
          </a>
        </div>
      </div>
    </article>
  </template>
}
