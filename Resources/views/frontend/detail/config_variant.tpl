{extends file="parent:frontend/detail/config_variant.tpl"}

{block name='frontend_detail_configurator_variant_group_option_label_image'}
    <span class="image--element">
        <span class="image--media">
            {if isset($media.thumbnails)}
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-srcset="{$media.thumbnails[0].sourceSet}" class="lazyload" alt="{$option.optionname}" />
            {else}
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{link file='frontend/_public/src/img/no-picture.jpg'}" class="lazyload" alt="{$option.optionname}">
            {/if}
        </span>
    </span>
{/block}
