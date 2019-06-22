{extends file="parent:frontend/listing/banner.tpl"}

{block name='frontend_listing_image_only_banner'}
    <picture>
        <source data-srcset="{$sBanner.media.thumbnails[1].sourceSet}" media="(min-width: 48em)">

        <img data-srcset="{$sBanner.media.thumbnails[0].sourceSet}" alt="{$sBanner.description|escape}" class="lazyload banner--img" />
    </picture>
{/block}

{block name='frontend_listing_normal_banner'}
    <a href="{$sBanner.link}" class="banner--link" {if $sBanner.link_target}target="{$sBanner.link_target}"{/if} title="{$sBanner.description|escape}">
        <picture>
            <source data-srcset="{$sBanner.media.thumbnails[1].sourceSet}" media="(min-width: 48em)">

            <img data-srcset="{$sBanner.media.thumbnails[0].sourceSet}" alt="{$sBanner.description|escape}" class="lazyload banner--img" />
        </picture>
    </a>
{/block}
