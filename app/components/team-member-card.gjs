import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';

/**
 * Componente de tarjeta de miembro del equipo
 * Clickeable - lleva al perfil completo del miembro
 */
export default class TeamMemberCard extends Component {
  <template>
    <LinkTo @route="profile" @model={{@member.id}} class="team-card-link">
      <article class="team-card team-card--clickable">
        <div class="team-card__avatar">
          {{@member.avatar}}
        </div>
        <div class="team-card__content">
          <h3 class="team-card__name">{{@member.name}}</h3>
          <p class="team-card__role">{{@member.role}}</p>
          <p class="team-card__bio">{{@member.bio}}</p>
          <div class="team-card__cta">
            <span class="btn btn-sm btn-outline">Ver perfil completo →</span>
          </div>
        </div>
      </article>
    </LinkTo>
  </template>
}
