<?php

namespace SpLazyLoad\Subscriber;

use Doctrine\Common\Collections\ArrayCollection;
use Enlight\Event\SubscriberInterface;
use Shopware\Components\Plugin\CachedConfigReader;

class TemplateRegistration implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginDir;

    /**
     * @var string
     */
    private $pluginName;

    /**
     * @var CachedConfigReader
     */
    private $config;

    /**
     * TemplateRegistration constructor.
     *
     * @param string             $pluginDir
     * @param string             $pluginName
     * @param CachedConfigReader $config
     */
    public function __construct($pluginDir, $pluginName, CachedConfigReader $config)
    {
        $this->pluginDir = $pluginDir;
        $this->pluginName = $pluginName;
        $this->config = $config->getByPluginName($pluginName);
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
            $this->pluginDir . '/vendor/lazysizes/lazysizes.min.js',
        ];

        return new ArrayCollection($jsFiles);
    }

    /**
     * @return string
     */
    public function prepareJavaScript()
    {
        $filename = $this->pluginDir . '/Resources/views/frontend/_public/src/js/lazySizesConfig.js';

        file_put_contents($filename, $this->config['lazySizesConfig']);

        return $filename;
    }
}
