<?php

namespace SpLazyLoad\Subscriber;

use Doctrine\Common\Collections\ArrayCollection;
use Enlight\Event\SubscriberInterface;

class TemplateRegistration implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginDir;

    /**
     * @var array
     */
    private $pluginConfig;

    /**
     * TemplateRegistration constructor.
     *
     * @param string $pluginDir
     * @param array  $pluginConfig
     */
    public function __construct(string $pluginDir, array $pluginConfig)
    {
        $this->pluginDir = $pluginDir;
        $this->pluginConfig = $pluginConfig;
    }

    /**
     * {@inheritdoc}
     */
    public static function getSubscribedEvents()
    {
        return [
            'Theme_Inheritance_Template_Directories_Collected' => 'onTemplateDirectoriesCollect',
            'Theme_Compiler_Collect_Plugin_Javascript' => 'onAddJavascriptFiles',
        ];
    }

    /**
     * @param \Enlight_Event_EventArgs $args
     */
    public function onTemplateDirectoriesCollect(\Enlight_Event_EventArgs $args)
    {
        $dirs = $args->getReturn();
        $dirs[] = $this->pluginDir . '/Resources/views/';

        $args->setReturn($dirs);
    }

    /**
     * @return ArrayCollection
     */
    public function onAddJavascriptFiles()
    {
        $jsFiles = [
            $this->prepareJavaScript(),
        ];

        return new ArrayCollection($jsFiles);
    }

    /**
     * @return string
     */
    public function prepareJavaScript()
    {
        $filename = $this->pluginDir . '/Resources/frontend/js/lazySizesConfig.js';

        file_put_contents($filename, $this->pluginConfig['lazySizesConfig']);

        return $filename;
    }
}
